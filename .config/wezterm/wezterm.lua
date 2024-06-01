local wezterm = require 'wezterm'
local io = require 'io'

local os_name = io.popen("uname"):read('*l')

local function set_brightness()
    if os_name == 'Linux' then
        return 0.5 -- for Linux
    else
        return 0.6 -- for Darwin
    end
end

return {
    front_end = "WebGpu",
    prefer_egl = true,
    font = wezterm.font_with_fallback {
        'JetBrains Mono',
        'DejaVu Sans Mono',
        'DejaVu Sans',
    },
    color_scheme = 'GruvboxDarkHard',
    window_background_image = wezterm.home_dir .. '/.config/wezterm/black_background.jpg',
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
    font_size = 12,
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
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
}
