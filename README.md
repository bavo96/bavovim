# bavovim
My custom vim's settings.

# MacOS or Ubuntu
- Install neovim
- Install tmux
- Set color for terminal
- Install vim-plug
- Install pynvim (for python3)
- Install NerdFonts (for this case install DejaVu): https://www.nerdfonts.com/font-downloads
- (only for MacOS) Install oh my zsh https://ohmyz.sh/#install 
- (only for MacOS) Activate anaconda after installing oh-my-zsh: https://stackoverflow.com/questions/40370467/anaconda-not-found-in-zsh

# Tmux
- Update modification: `tmux source ~/.tmux.conf`

# Nvim
- Install plugins in vim-plug: `:PlugInstall`

# Coc Nvim
- Install nodejs >= 12.12
  + Change node version: `nvm use 16`
  + Check node version: `node -v`

# Vim-devicons
- Install these two on MacOS:
  + `brew install --cask font-hack-nerd-font` 
  + `brew tap homebrew/cask-fonts`
- Run: `fc-cache -f -v`
- Choose `Hack Nerd Font (Mono)` on Terminal

# Font
- Error when using font in wezterm: https://github.com/wez/wezterm/issues/2660

# Other commands in Ubuntu
- Install gnome tweak to swap keys in Ubuntu
- Swap caplocks/ctrl on Ubuntu: 
  - `setxkbmap -layout us -option ctrl:swapcaps` (https://askubuntu.com/questions/33774/how-do-i-remap-the-caps-lock-and-ctrl-keys)
- Show small icons on Ubuntu's favorite bar: `gsettings set org.gnome.shell.extensions.dash-to-dock icon-size-fixed false`
- Preview file in Ubuntu: `sudo apt-get install gnome-sushi`
- Mapping in vim: https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping

