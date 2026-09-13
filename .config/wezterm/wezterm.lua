local wezterm = require 'wezterm'
local io = require 'io'
local mux = wezterm.mux

local os_name = io.popen("uname"):read('*l')

local function set_brightness()
    if os_name == 'Linux' then
        return 0.5 -- for Linux
    else
        return 0.6 -- for Darwin
    end
end

-- Restore WezTerm tabs on relaunch: read the tmux session names that
-- tmux-resurrect last saved to disk, and open one tab per session,
-- attaching to it (or creating it if it doesn't exist yet).
--
-- tmux-resurrect saves to ~/.tmux/resurrect only if that directory already
-- exists; otherwise it falls back to the XDG path
-- ($XDG_DATA_HOME or ~/.local/share)/tmux/resurrect. Mirror that same
-- resolution here so this doesn't silently point at a file that's never
-- written (which used to make every relaunch fall back to a single "main"
-- tab, dropping every other saved session).
local function dir_exists(path)
    local p = io.popen('[ -d "' .. path .. '" ] && echo yes')
    if not p then
        return false
    end
    local result = p:read('*l')
    p:close()
    return result == 'yes'
end

local function resurrect_last_path()
    local legacy_dir = wezterm.home_dir .. '/.tmux/resurrect'
    if dir_exists(legacy_dir) then
        return legacy_dir .. '/last'
    end
    local xdg_data_home = os.getenv('XDG_DATA_HOME')
    if xdg_data_home and xdg_data_home ~= '' then
        return xdg_data_home .. '/tmux/resurrect/last'
    end
    return wezterm.home_dir .. '/.local/share/tmux/resurrect/last'
end

local function saved_tmux_session_names()
    local names = {}
    local f = io.open(resurrect_last_path(), 'r')
    if not f then
        return names
    end
    for line in f:lines() do
        local fields = {}
        for field in line:gmatch('[^\t]+') do
            table.insert(fields, field)
        end
        if fields[1] == 'pane' and fields[2] then
            names[fields[2]] = true
        end
    end
    f:close()

    local list = {}
    for name in pairs(names) do
        table.insert(list, name)
    end
    table.sort(list)
    return list
end

local function shell_sleep(seconds)
    local p = io.popen('sleep ' .. tostring(seconds))
    if p then
        p:close()
    end
end

local function live_tmux_session_names()
    local names = {}
    local p = io.popen('tmux list-sessions -F "#{session_name}" 2>/dev/null')
    if not p then
        return names
    end
    for line in p:lines() do
        names[line] = true
    end
    p:close()
    return names
end

local function all_sessions_present(expected, current)
    for _, name in ipairs(expected) do
        if not current[name] then
            return false
        end
    end
    return true
end

-- Block (this only delays GUI startup once, not per-frame) until
-- tmux-continuum's background restore has recreated every expected
-- session, or until timeout_secs have passed -- whichever comes first.
--
-- continuum's restore script sleeps 1s before invoking tmux-resurrect's
-- restore.sh, so there's no point polling before that.
local function wait_for_restore(expected_names, timeout_secs)
    shell_sleep(1.2)
    local waited = 1.2
    while waited < timeout_secs do
        if all_sessions_present(expected_names, live_tmux_session_names()) then
            return
        end
        shell_sleep(0.3)
        waited = waited + 0.3
    end
end

wezterm.on('gui-startup', function(cmd)
    local names = saved_tmux_session_names()
    if #names == 0 then
        names = { 'main' } -- fallback when nothing has been saved yet
    end

    -- Start the tmux server through exactly ONE client: tmux-continuum
    -- decides whether to auto-restore by counting how many tmux processes
    -- exist at server startup (tmux-continuum/scripts/helpers.sh,
    -- another_tmux_server_running_on_startup). If we spawn all N tabs'
    -- `tmux new-session` clients up front (even staggered by a fixed
    -- sleep), continuum can see more than one tmux process during that
    -- check, assume another server is already running, and silently skip
    -- the restore -- every tab then ends up as a bare empty session
    -- instead of resurrect replaying saved windows/panes/cwd.
    --
    -- So: spawn only the first session here (the lone tmux process),
    -- actually wait for continuum's restore to finish (poll instead of
    -- guessing a fixed delay), then open the rest as plain attaches to
    -- whatever sessions the restore produced.
    local tab, pane, window = mux.spawn_window { args = { 'tmux', 'new-session', '-A', '-s', names[1] } }
    tab:set_title(names[1])

    if #names > 1 then
        wait_for_restore(names, 8)
        for i = 2, #names do
            local name = names[i]
            local t = window:spawn_tab { args = { 'tmux', 'new-session', '-A', '-s', name } }
            t:set_title(name)
        end
    end
end)

return {
    -- GUI-launched WezTerm (Spotlight/Dock, not a Terminal) does NOT source
    -- ~/.zshrc, so it inherits macOS's bare default PATH
    -- ("/usr/bin:/bin:/usr/sbin:/sbin"). mux.spawn_window's `tmux` gui-startup
    -- calls above exec the "tmux" binary directly (no shell), so if it's only
    -- reachable via Homebrew (/opt/homebrew/bin) this fails with:
    --   "No viable candidates found in PATH ..." / process didn't exit cleanly
    -- Fix: explicitly extend PATH for everything WezTerm spawns.
    set_environment_variables = {
        PATH = '/opt/homebrew/bin:/usr/local/bin:' .. (os.getenv('PATH') or ''),
    },
    front_end = "WebGpu",
    prefer_egl = true,
    font = wezterm.font_with_fallback {
        'JetBrains Mono',
        'DejaVu Sans Mono',
        'DejaVu Sans',
    },
    color_scheme = 'GruvboxDarkHard',
    window_background_image = wezterm.home_dir .. '/.config/wezterm/batman.jpg',
    window_background_image_hsb = {
        -- Darken the background image by reducing it to 1/3rd
        brightness = set_brightness(),
        -- You can adjust the hue by scaling its value.
        -- a multiplier of 1.0 leaves the value unchanged.
        hue = 1.0,
        -- You can adjust the saturation also.
        saturation = 1.0,
    },
    window_background_opacity = 1,
    text_background_opacity = 1,
    font_size = 13,
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    keys = {
        -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
        { key = "LeftArrow",  mods = "OPT", action = wezterm.action { SendString = "\x1bb" } },
        -- Make Option-Right equivalent to Alt-f; forward-word
        { key = "RightArrow", mods = "OPT", action = wezterm.action { SendString = "\x1bf" } },
        -- Make Command-r equivalent to reset current wezterm terminal
        { key = "r",          mods = "CMD", action = wezterm.action.ResetTerminal },
        -- {key='C',mods='SHIFT|CTRL', action=wezterm.action.CopyTo 'ClipboardAndPrimarySelection', },
    },
    enable_scroll_bar = true,
    min_scroll_bar_height = '2cell',
    colors = {
        scrollbar_thumb = 'gray',
    },
    check_for_updates = false,
    check_for_updates_interval_seconds = 3600 * 24 * 7,
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
    warn_about_missing_glyphs = false,
}
