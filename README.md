# bavovim
My custom vim's settings.

## 1. Installation 
### wezterm: 
    - Link: https://wezfurlong.org/wezterm/installation.html
    - Move between words in command line (macOS): https://github.com/wez/wezterm/issues/253
    - Error when using font in wezterm: https://github.com/wez/wezterm/issues/2660
### neovim: 
    - Link: https://github.com/neovim/neovim/wiki/Installing-Neovim
### tmux: 
    - Link: https://github.com/tmux/tmux/wiki/Installing
    - Install tmux plugins: https://github.com/tmux-plugins/tpm#installation
    - Source tmux: `tmux source ~/.tmux.conf`
### NerdFonts (choose DejaVu): 
    - Link: https://www.nerdfonts.com/font-downloads
### packer (neovim's plugins manager): 
    - Link: https://github.com/wbthomason/packer.nvim#quickstart
### Lazygit
    - Link: https://github.com/jesseduffield/lazygit
### LSP
    - Server configuration for lspconfig: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    - Use mason to install LSP servers and setup via lspconfig file. Currently lsp servers: 'pyright', 'lua_ls', 'marksman'

### For macOS only
    - Install oh-my-zsh: https://ohmyz.sh/#install 
    - Activate anaconda after installing oh-my-zsh: https://stackoverflow.com/questions/40370467/anaconda-not-found-in-zsh
    - Install xcode: `xcode-select --install`
### For Linux only
    - Install oh-my-bash: https://github.com/ohmybash/oh-my-bash#basic-installation

## 2. Vim's knowledge 
    - Mapping in vim: https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
    - https://alpha2phi.medium.com/neovim-for-beginners-fuzzy-file-search-part-1-9df21c0e2c84
    - Link: https://github.com/rockerBOO/awesome-neovim
    - We may need `xclip` (on Linux) or `pbcopy` (on Mac) to copy text to clipboard in vim.
    - About lspconfig, according to chatgpt:
        + `neovim/nvim-lspconfig`: This plugin provides configurations for Neovim's built-in Language Server Protocol (LSP), which allows for IDE-like features such as code completion, diagnostics, and more.
        + `hrsh7th/nvim-cmp`: This plugin is an autocompletion plugin which provides IDE-like autocompletion for code. It works with various sources such as LSP, snippets, spell, path, buffer, and more.
        + `hrsh7th/cmp-nvim-lsp`: This plugin is a source plugin that provides autocompletion for LSP by integrating with `nvim-cmp`. It allows you to use LSP as a source for autocompletion.
        + `L3MON4D3/LuaSnip`: This plugin is a snippets plugin that provides a fast and efficient way to insert snippets while typing. LuaSnip provides a lot of snippets by default and you can create your own snippets.
        + `saadparwaiz1/cmp_luasnip`: This plugin is a source plugin that provides snippets support for `nvim-cmp` by integrating with the LuaSnip plugin. It allows you to use LuaSnip as a source for autocompletion.

## Useful mappings
### barbar
| Keys | Description |
--- | --- |
| Control + q | Quit current buffer. |
| Control + aq | Quit all buffers. |
| Space + number | Move to a buffer by index (1 - 10). |
### Comment
| Keys | Description |
--- | --- |
| Control + n | Toggle comment in normal and visual modes. |
### nvim-tree
| Keys | Description |
--- | --- |
| Control + p | Toggle tree. |
| Control + h/j/k/l | Navigation in nvim-tree. |
### packer
| Keys | Description |
--- | --- |
| Space + ps | PackerSync |
### telescope
| Keys | Description |
--- | --- |
| Space + ff | Find files in current parent directory. |
| Space + fg | Grep text in current parent directory. |
### lazygit 
| Keys | Description |
--- | --- |
| Space + g | Toggle lazygit. |
### mason
| Keys | Description |
--- | --- |
| Space + ms | Toggle mason. |
### Others
| Keys | Description |
--- | --- |
| Space + f | Turn off highlighting. |

## 4. TODO
    - Learn fzf.
    - Write a document about common keymaps in neovim.
    - Using git in neovim efficiently (lazygit, gitsigns).
    - Copy/Paste in Tmux.
    - Create a default windows when open tmux or open a new window.
    - Include zshrc/bashrc file with oh-my-zsh/bash.
    - Using lspconfig efficiently.

