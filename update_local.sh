# Copy all folders in repo to local config
rsync -a --delete --exclude=plugin/ .config/nvim/ ~/.config/nvim/
rsync -a --delete --exclude=plugins/ .config/tmux/ ~/.config/tmux/
rsync -a --delete .config/wezterm/ ~/.config/wezterm/
if [ "$(uname)" == "Darwin" ]
then
    rsync -a --delete .zshrc ~/.zshrc
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]
then
    echo "Copy from repo to bashrc"
fi
