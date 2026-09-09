#!/bin/bash
#
# Schedules nvim_heap_guard.sh to run periodically:
#   - macOS: a launchd LaunchAgent (~/Library/LaunchAgents), runs every 6h.
#   - Linux: a crontab entry, runs every 6h.
# Safe to re-run: replaces any previously installed job of the same name.

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
GUARD_SCRIPT="$REPO_DIR/scripts/nvim_heap_guard.sh"
chmod +x "$GUARD_SCRIPT"

if [[ "$(uname)" == "Darwin" ]]; then
    LABEL="com.bavo.nvim-heap-guard"
    PLIST="$HOME/Library/LaunchAgents/${LABEL}.plist"
    mkdir -p "$HOME/Library/LaunchAgents" "$HOME/.cache"

    cat >"$PLIST" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>${LABEL}</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/bash</string>
        <string>${GUARD_SCRIPT}</string>
    </array>
    <key>StartInterval</key>
    <integer>21600</integer>
    <key>RunAtLoad</key>
    <false/>
    <key>StandardOutPath</key>
    <string>${HOME}/.cache/nvim_heap_guard.stdout.log</string>
    <key>StandardErrorPath</key>
    <string>${HOME}/.cache/nvim_heap_guard.stderr.log</string>
</dict>
</plist>
EOF

    launchctl unload "$PLIST" >/dev/null 2>&1 || true
    launchctl load -w "$PLIST"
    echo "Installed launchd job '${LABEL}' — runs every 6h."
    echo "Log: ~/.cache/nvim_heap_guard.log"

elif [[ "$(expr substr "$(uname -s)" 1 5)" == "Linux" ]]; then
    CRON_LINE="0 */6 * * * /bin/bash ${GUARD_SCRIPT} >/dev/null 2>&1"
    (crontab -l 2>/dev/null | grep -v "nvim_heap_guard.sh"; echo "$CRON_LINE") | crontab -
    echo "Installed cron job — runs every 6h."
    echo "Log: ~/.cache/nvim_heap_guard.log"

else
    echo "Unsupported OS for nvim heap guard scheduling; skipping."
fi
