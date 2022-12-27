# bavovim
My custom vim's settings.

# MacOS or Ubuntu
- Install neovim
- Install tmux
- Set color for terminal
- Install vim-plug
- Install pynvim (for python3)
- Install NerdFonts (for this case install DejaVu): https://www.nerdfonts.com/font-downloads

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

# Other commands
- Swap caplocks/ctrl on Ubuntu: 
  - `setxkbmap -layout us -option ctrl:swapcaps` (https://askubuntu.com/questions/33774/how-do-i-remap-the-caps-lock-and-ctrl-keys)
- Show small icons on Ubuntu's favorite bar: `gsettings set org.gnome.shell.extensions.dash-to-dock icon-size-fixed false`
