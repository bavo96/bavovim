# Copy all folders in local config to repo
rsync -a --delete ~/.config/nvim/ .config/nvim/
rsync -a --delete ~/.config/tmux/ .config/tmux/
rsync -a --delete ~/.config/wezterm/ .config/wezterm/
