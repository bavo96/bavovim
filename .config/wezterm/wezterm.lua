local wezterm = require 'wezterm'
return {
  font = wezterm.font '',
  font = wezterm.font_with_fallback {
    'DejaVu Sans Mono',
    'DejaVu Sans'
  },
  color_scheme = 'Batman',
}
