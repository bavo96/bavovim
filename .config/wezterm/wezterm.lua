local wezterm = require 'wezterm'
local os = require 'os'
local io = require 'io'

os_name = io.popen("uname"):read('*l')

local function set_brightness()
  if os_name == 'Linux' then
    return 0.3 -- for Linux
  else
    return 0.4 -- for Darwin
  end
end

return {
  font = wezterm.font_with_fallback {
    'DejaVu Sans Mono',
    'DejaVu Sans'
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
  font_size = 12,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  keys = {
    -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
    {key="LeftArrow", mods="OPT", action=wezterm.action{SendString="\x1bb"}},
    -- Make Option-Right equivalent to Alt-f; forward-word
    {key="RightArrow", mods="OPT", action=wezterm.action{SendString="\x1bf"}},
    {key='C',mods = 'CTRL', action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection',
  },
  },
  enable_scroll_bar = true,
  check_for_updates = true,
  show_update_window = false,
  check_for_updates_interval_seconds = 3600 * 24 * 7

}
