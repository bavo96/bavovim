# bavovim
My custom vim's settings.
![plot](./bavovim.png)

## 1. Installation 
### Add configuration
```bash
chmod +x update_local.sh
./update_local.sh
```
### Neovim
- link: https://github.com/neovim/neovim/wiki/Installing-Neovim
### wezterm: 
- Link: https://wezfurlong.org/wezterm/installation.html
- Move between words in command line (macOS): https://github.com/wez/wezterm/issues/253
- Error when using font in wezterm: https://github.com/wez/wezterm/issues/2660
### neovim: 
- Link: https://github.com/neovim/neovim/wiki/Installing-Neovim
### tmux: 
- Link: https://github.com/tmux/tmux/wiki/Installing
- Install tmux plugin manager: https://github.com/tmux-plugins/tpm#installation
### NerdFonts: 
- Link: https://www.nerdfonts.com/font-downloads
- Install `JetBrains Mono`, `DejaVu Sans`, `Dejavu Sans Mono`
### packer (neovim's plugins manager): 
- Link: https://github.com/wbthomason/packer.nvim#quickstart
### Lazygit
- Link: https://github.com/jesseduffield/lazygit
### LSP
- Server configuration for lspconfig: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
- Use mason to install LSP servers and setup via lspconfig file. Currently lsp servers: 'pyright', 'lua_ls', 'dartls', 'bashls'
### ripgrep (for telescope)
- Link: https://github.com/BurntSushi/ripgrep
### color in neovim
- Change color in [gruvbox](./config/)
### For macOS only
- Install oh-my-zsh: https://ohmyz.sh/#install 
- Activate anaconda after installing oh-my-zsh: https://stackoverflow.com/questions/40370467/anaconda-not-found-in-zsh
- Install xcode: `xcode-select --install`
### For Linux only
- Install oh-my-bash: https://github.com/ohmybash/oh-my-bash#basic-installation

## 2. Useful mappings
### tmux (prefix: Control + g)
| Keys | Description |
--- | --- |
| prefix + h/j/k/l | Navigation in tmux. |
| prefix + H/J/K/L | Resize current pane. |
| prefix + d | Detach current session. |
| prefix + s | Show all sessions. |
| prefix + w | Show all windows. |
| prefix + r | Source tmux. |
| prefix + I | Install tmux's plugins. |
| prefix + , | Rename windows. |
| prefix + Alt + u | Remove tmux's plugins. |
| prefix + [ | Enter copy mode. |
| Control + c | Exit copy mode. |
| prefix + x | Quit current pane with confirmation. |
| prefix + v | Quit current window without confirmation. |
| Control + d | Quit current pane without confirmation (Can't use in neovim). |
| prefix + N | Create a template window in tmux (top neovim, bottom terminal). |
#### some command lines
```bash
tmux new -s <name> # Create new session
tmux attach -t <name> # Attach a session
tmux source-file ~/.tmux.conf
```

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
| Space + gg | Toggle lazygit. |
### mason
| Keys | Description |
--- | --- |
| Space + ms | Toggle mason. |
### vim-illuminate
| Keys | Description |
--- | --- |
| Alt + p | Move to the previous reference. |
| Alt + n | Move to the next reference. |
### lsp
| Keys | Description |
--- | --- |
| Space + f | Format current buffer. |
| Space + rn | Rename a variable in a file. |
| K | Hover on function to show description. |
| gD | Go to declaration. |
| gd | Go to definition. |
| gr | Show references of a variable. |
| gl | Show line diagnostic. |
| Control + d | Go to next diagnostic. |
| Control + u | Go to previous diagnostic. |
| gll | Show list of diagnostics. |

### Others
| Keys | Description |
--- | --- |
| Space + a | Turn off highlighting. |
| Control + o | Go to [count] older cursor position in jump list. |
| Control + i | Go to [count] newer cursor position in jump list. |

## 3. TODO
- UI customization for lsp: https://github.com/neovim/nvim-lspconfig/wiki/UI-customization.
- Disable command history
- Learn fzf.
- Using git in neovim efficiently (lazygit, gitsigns).
- Copy/Paste in Tmux.
- Create a default windows when open tmux or open a new window.
- Include zshrc/bashrc file with oh-my-zsh/bash.

## 4. Vim's knowledge 
- Mapping in vim: https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
- https://alpha2phi.medium.com/neovim-for-beginners-fuzzy-file-search-part-1-9df21c0e2c84
- Link: https://github.com/rockerBOO/awesome-neovim
- About lspconfig, according to chatgpt:
    + `neovim/nvim-lspconfig`: This plugin provides configurations for Neovim's built-in Language Server Protocol (LSP), which allows for IDE-like features such as code completion, diagnostics, and more.
    + `hrsh7th/nvim-cmp`: This plugin is an autocompletion plugin which provides IDE-like autocompletion for code. It works with various sources such as LSP, snippets, spell, path, buffer, and more.
    + `hrsh7th/cmp-nvim-lsp`: This plugin is a source plugin that provides autocompletion for LSP by integrating with `nvim-cmp`. It allows you to use LSP as a source for autocompletion.
    + `L3MON4D3/LuaSnip`: This plugin is a snippets plugin that provides a fast and efficient way to insert snippets while typing. LuaSnip provides a lot of snippets by default and you can create your own snippets.
    + `saadparwaiz1/cmp_luasnip`: This plugin is a source plugin that provides snippets support for `nvim-cmp` by integrating with the LuaSnip plugin. It allows you to use LuaSnip as a source for autocompletion.
- About vim: https://learnvimscriptthehardway.stevelosh.com/

