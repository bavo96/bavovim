# bavovim
My custom vim's settings.

# MacOS or Ubuntu
- Install wezterm
- Install neovim
- Install tmux
- Install NerdFonts (for this case install DejaVu): https://www.nerdfonts.com/font-downloads
- (only for MacOS) Install oh my zsh https://ohmyz.sh/#install 
- (only for MacOS) Activate anaconda after installing oh-my-zsh: https://stackoverflow.com/questions/40370467/anaconda-not-found-in-zsh

# Wezterm
- https://github.com/wez/wezterm/issues/253

# Tmux
- Install tmux plugins: git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
- Update modification: `tmux source ~/.tmux.conf`


# Nvim
- Install vim-plug
- Install plugins in vim-plug: `:PlugInstall`
- Install pynvim (for python3 healthcheck)

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

# Neovim tutorial
- https://alpha2phi.medium.com/neovim-for-beginners-fuzzy-file-search-part-1-9df21c0e2c84

# TODO
- Learn fzf
- Using git in neovim efficiently
- LSP Server for python
- Bug reading README.md file
- Copy/Paste in Tmux 
- Verify zshrc/bashrc file with oh-my-zsh/bash
