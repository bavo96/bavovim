local wezterm = require 'wezterm'

return {
  font = wezterm.font_with_fallback {
    'DejaVu Sans Mono',
    'DejaVu Sans'
  },
  color_scheme = 'Material Darker (base16)',
  default_prog = { '/bin/zsh', '-l' },
  window_background_image = wezterm.home_dir .. '/.config/wezterm/batman.jpeg',
  window_background_image_hsb = {
    -- Darken the background image by reducing it to 1/3rd
    brightness = 0.2,

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
  }
}
