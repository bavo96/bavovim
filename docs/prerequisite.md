# Prerequisites
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
- Install go for `buf` (protobuf): https://go.dev/dl/
- Use mason to install LSP servers and setup via lspconfig file. Currently lsp servers: `pylsp`, `lua_ls`, `bashls`, `ruff`
- Use nonels to install dependencies like `isort`, `buf`
- Current support: `pylsp`, `lua_ls`, `bashls`, `ruff`, `html`, `cssls`, `isort`, `buf`
### ripgrep (for telescope)
- Link: https://github.com/BurntSushi/ripgrep
### color in neovim
- Change color in [gruvbox](./.config/)
- Other top colorschemes: https://dotfyle.com/neovim/colorscheme/top
### ChatGPT
- First method (recommended): Use gpg to encrypt secret file and pass the decrypt command to `api_key_cmd` in [lua/chatgpt.lua](./.config/nvim/lua/chatgpt.lua)
    - Bug `gpg: agent_genkey failed: Timeout`:
        - Run in sudo mode (not recommended).
        - From this [link](https://superuser.com/questions/520980/how-to-force-gpg-to-use-console-mode-pinentry-to-prompt-for-passwords/521027#521027)
            - Install `sudo apt install pinentry-tty` and `sudo update-alternatives --config pinentry` to choose `pineentry-tty`
    - Bug `gpg: can't connect to the agent: IPC connect call failed`:
        - Make sure no wrong option in `~/.gnupg/gpg-agent.conf`
    - Generate key/pair : `gpg --generate-key`
    - Create encrypted gpg file: `gpg --encrypt --output chatgpt_secret.gpg --recipient <recipient> chatgpt_secret.txt` (<recipient> is the email of the recipient)
    - Decrypt file: `gpg --decrypt chatgpt_secret.gpg` (for local user only, otherwise must specify --local-user option)
- Second method: Add `OPENAI_API_KEY` to environment variable (not recommended)
### Copilot
- Github account -> Your copilot -> Copilot in your IDE
- Type `:Copilot setup` to set up copilot on a new computer
### For macOS only
- Install oh-my-zsh: https://ohmyz.sh/#install 
- Activate anaconda after installing oh-my-zsh: https://stackoverflow.com/questions/40370467/anaconda-not-found-in-zsh
- Install xcode: `xcode-select --install`
### For Linux only
- Install oh-my-bash: https://github.com/ohmybash/oh-my-bash#basic-installation
