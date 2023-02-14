local wezterm = require 'wezterm'
return {
  font = wezterm.font_with_fallback {
    'DejaVu Sans Mono',
    'DejaVu Sans'
  },
  color_scheme = 'Breeze',
  default_prog = { '/bin/zsh', '-l' },
  window_background_image = '/Users/bangvo/.config/wezterm/batman.jpeg',
  window_background_opacity = 1,
  text_background_opacity = 1,
  font_size = 14,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  }
}
