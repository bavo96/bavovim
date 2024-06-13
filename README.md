# bavovim
My custom vim's settings.
![plot](./bavovim.png)

## 1. Installation 
### Add configuration
```bash
chmod +x update_local.sh
./update_local.sh
```
### wezterm: 
- Link: https://wezfurlong.org/wezterm/installation.html (install .deb file)
- Move between words in command line (macOS): https://github.com/wez/wezterm/issues/253
- Error when using font in wezterm: https://github.com/wez/wezterm/issues/2660
### neovim: 
- Link: https://github.com/neovim/neovim/blob/master/INSTALL.md#appimage-universal-linux-package
- ```bash
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  chmod u+x nvim.appimage
  mkdir -p /opt/nvim
  mv nvim.appimage /opt/nvim/nvim
  ```
### tmux: 
- Link: https://github.com/tmux/tmux/wiki/Installing
- Install tmux plugin manager: https://github.com/tmux-plugins/tpm#installation
- In this case, change path to `git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm`
### nerdfonts: 
- Link: https://www.nerdfonts.com/font-downloads
- Install `JetBrains Mono`, `DejaVu Sans`, `Dejavu Sans Mono`
### lazy.nvim (plugin manager)
- Link: https://github.com/folke/lazy.nvim?tab=readme-ov-file#-installation
### lazygit
- Link: https://github.com/jesseduffield/lazygit
### lsp
- Server configuration for lspconfig: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
- Use mason to install LSP servers and setup via lspconfig file. Currently lsp servers: `pylsp`, `lua_ls`, `bashls`, `ruff_lsp`
- Use mason to install dependencies like `isort`, `ruff`
### ripgrep (for telescope)
- Link: https://github.com/BurntSushi/ripgrep
### color in neovim
- Change color in [gruvbox](./.config/)
### ChatGPT
- First method (recommended): Use gpg to encrypt secret file and pass the decrypt command to `api_key_cmd` in (lua/chatgpt.lua)[./.config/nvim/lua/chatgpt.lua]
 - Generate key/pair : `gpg --generate-key`
  - Bug `gpg: agent_genkey failed: Timeout`:
   - Run in sudo mode.
   - From this (link)[https://superuser.com/questions/520980/how-to-force-gpg-to-use-console-mode-pinentry-to-prompt-for-passwords/521027#521027]
    - `touch ~/.gnupg/gpg-agent.conf`
    - Add `pinentry /usr/bin/pinentry-tty` to the file
    - May need to install `sudo apt install pinentry-tty` and `sudo update-alternatives --config pinentry` to choose `pineentry-tty`
   - Generate key again.
 - Create encrypted gpg file: `gpg --encrypt --output chatgpt_secret.gpg --recipient <recipient> chatgpt_secret.txt`
 - Decrypt file: `gpg --decrypt chatgpt_secret.gpg` (for local user only, otherwise must specify --local-user option)
- Second method: - Add `OPENAI_API_KEY` to environment variable (not recommended)
### Copilot
- Github account -> Your copilot -> Copilot in your IDE
- Type `:Copilot setup` to set up copilot on a new computer
### For macOS only
- Install oh-my-zsh: https://ohmyz.sh/#install 
- Activate anaconda after installing oh-my-zsh: https://stackoverflow.com/questions/40370467/anaconda-not-found-in-zsh
- Install xcode: `xcode-select --install`
### For Linux only
- Install oh-my-bash: https://github.com/ohmybash/oh-my-bash#basic-installation

## 2. Useful mappings
- See [useful_mappings.md](./docs/useful_mappings.md)

