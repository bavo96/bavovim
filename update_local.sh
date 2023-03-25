# Copy all folders in repo to local config
rsync -a --delete .config/nvim/ ~/.config/nvim/
rsync -a --delete .config/tmux/ ~/.config/tmux/
rsync -a --delete .config/wezterm/ ~/.config/wezterm/
