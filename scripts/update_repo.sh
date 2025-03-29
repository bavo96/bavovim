#!/bin/bash

# Copy all folders in local config to repo
rsync -a --delete --exclude=plugin/ ~/.config/nvim/ .config/nvim/
rsync -a --delete --exclude=plugins/ ~/.config/tmux/ .config/tmux/
rsync -a --delete ~/.config/wezterm/ .config/wezterm/
rsync -a --delete ~/.condarc .condarc
if [ "$(uname)" == "Darwin" ]
then
    rsync -a --delete ~/.zshrc .zshrc
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]
then
    rsync -a --delete ~/.bashrc .bashrc
fi
