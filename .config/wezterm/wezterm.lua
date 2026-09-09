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

wezterm.on('gui-startup', function(cmd)
    local names = saved_tmux_session_names()
    if #names == 0 then
        names = { 'main' } -- fallback when nothing has been saved yet
    end

    local window
    for i, name in ipairs(names) do
        local args
        if i == 1 then
            -- first tab starts the tmux server; continuum's restore hook
            -- runs off this and recreates all saved sessions/windows/panes
            args = { 'tmux', 'new-session', '-A', '-s', name }
        else
            -- give continuum's restore a head start so this doesn't race
            -- it and create an empty duplicate session
            args = { 'sh', '-c', 'sleep 1.5; exec tmux new-session -A -s ' .. name }
        end

        if i == 1 then
            local tab, pane
            tab, pane, window = mux.spawn_window { args = args }
            tab:set_title(name)
        else
            local tab = window:spawn_tab { args = args }
            tab:set_title(name)
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
