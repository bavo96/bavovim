#!/usr/bin/env bash
#
# nvim_heap_guard.sh
#
# Long-lived nvim panes accumulate heap (undo history, LSP/Treesitter caches)
# that the allocator never returns to the OS. Once idle, macOS swaps that heap
# out; with enough long-lived panes this can eat the whole swap file.
#
# This script finds nvim processes that are old and/or heavy, maps them back
# to their tmux pane, and — ONLY if the pane has zero unsaved buffers — saves
# the window layout with :mksession, quits nvim, and relaunches it with the
# saved session so the heap is released. Panes with unsaved changes are
# skipped and logged, never touched.
#
# Installed as a launchd (macOS) / cron (Linux) job by install_nvim_guard.sh.
# Safe to run by hand too: bash scripts/nvim_heap_guard.sh

set -uo pipefail

MAX_AGE_DAYS="${NVIM_GUARD_MAX_AGE_DAYS:-14}"
MAX_RSS_MB="${NVIM_GUARD_MAX_RSS_MB:-1500}"
LOG_FILE="${NVIM_GUARD_LOG:-$HOME/.cache/nvim_heap_guard.log}"
SESSION_DIR="${NVIM_GUARD_SESSION_DIR:-$HOME/.cache/nvim_sessions}"

mkdir -p "$SESSION_DIR" "$(dirname "$LOG_FILE")"

log() { echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" >>"$LOG_FILE"; }

command -v tmux >/dev/null 2>&1 || exit 0
tmux list-sessions >/dev/null 2>&1 || exit 0

# ps etime looks like "[[DD-]HH:]MM:SS" — pull the day count out of it.
etime_to_days() {
    local etime="$1"
    [[ "$etime" == *-* ]] && echo "${etime%%-*}" || echo 0
}

# Map every tmux pane's pane_pid -> "session:window.pane" for quick lookup.
declare -A PANE_OF
while IFS='|' read -r target pid; do
    [[ -n "$pid" ]] && PANE_OF["$pid"]="$target"
done < <(tmux list-panes -a -F "#{session_name}:#{window_index}.#{pane_index}|#{pane_pid}" 2>/dev/null)

# Walk up the process tree from an nvim pid until a known tmux pane_pid is
# found (nvim's parent is often a job-control nvim, whose parent is the pane).
find_pane_for_pid() {
    local pid="$1" hops=0
    while [[ -n "$pid" && "$pid" != "1" && $hops -lt 6 ]]; do
        if [[ -n "${PANE_OF[$pid]:-}" ]]; then
            echo "${PANE_OF[$pid]}"
            return 0
        fi
        pid="$(ps -o ppid= -p "$pid" 2>/dev/null | tr -d ' ')"
        hops=$((hops + 1))
    done
    return 1
}

# Ask the nvim in $1 how many modified (unsaved) buffers it has, via a
# throwaway :echo — never assume 0 on a parse failure.
nvim_modified_count() {
    local pane="$1" marker="NVIMGUARD$$"
    tmux send-keys -t "$pane" Escape 2>/dev/null
    tmux send-keys -t "$pane" ":echo '${marker}=' . len(filter(getbufinfo(), 'v:val.changed'))" Enter 2>/dev/null
    sleep 0.5
    tmux capture-pane -p -t "$pane" -S -3 2>/dev/null | grep -o "${marker}=[0-9]*" | tail -1 | cut -d= -f2
}

restart_pane_nvim() {
    local pane="$1" pid="$2"
    local sess_file="$SESSION_DIR/$(echo "$pane" | tr ':.' '__').vim"

    tmux send-keys -t "$pane" Escape 2>/dev/null
    tmux send-keys -t "$pane" ":mksession! $sess_file" Enter 2>/dev/null
    sleep 0.5
    tmux send-keys -t "$pane" ":qa" Enter 2>/dev/null
    sleep 1

    # A process sitting deep in swap thrash can be stuck in uninterruptible
    # sleep and ignore :qa and SIGTERM alike — escalate to SIGKILL.
    if ps -p "$pid" >/dev/null 2>&1; then
        kill -TERM "$pid" 2>/dev/null
        sleep 2
    fi
    if ps -p "$pid" >/dev/null 2>&1; then
        kill -9 "$pid" 2>/dev/null
        sleep 1
    fi

    if [[ -f "$sess_file" ]]; then
        tmux send-keys -t "$pane" "clear && nvim -S '$sess_file'" Enter 2>/dev/null
        log "restarted nvim in $pane (was pid $pid, session saved to $sess_file)"
    else
        log "WARN: session file missing for $pane, relaunching plain nvim (was pid $pid)"
        tmux send-keys -t "$pane" "clear && nvim" Enter 2>/dev/null
    fi
}

ps -axo pid=,etime=,rss=,comm= | while read -r pid etime rss comm; do
    [[ "$comm" == *nvim* ]] || continue

    days="$(etime_to_days "$etime")"
    rss_mb=$((rss / 1024))
    if ((days < MAX_AGE_DAYS && rss_mb < MAX_RSS_MB)); then
        continue
    fi

    pane="$(find_pane_for_pid "$pid")" || {
        log "pid $pid (${days}d old, ${rss_mb}MB) is not inside a tmux pane, skipping"
        continue
    }

    modified="$(nvim_modified_count "$pane")"
    if [[ -z "$modified" ]]; then
        log "pane $pane (pid $pid): could not confirm 0 unsaved buffers, skipping"
        continue
    fi
    if ((modified > 0)); then
        log "pane $pane (pid $pid): $modified unsaved buffer(s), skipping restart"
        continue
    fi

    log "pane $pane: restarting nvim pid $pid (${days}d old, ${rss_mb}MB RSS)"
    restart_pane_nvim "$pane" "$pid"
done
