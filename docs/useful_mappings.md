# USEFUL MAPPING
## tmux (prefix: Control + g)
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
### some command lines
```bash
tmux new -s <name> # Create new session
tmux attach -t <name> # Attach a session
tmux source-file ~/.tmux.conf
```
## barbar
| Keys | Description |
--- | --- |
| Control + q | Quit current buffer. |
| Control + aq | Quit all buffers. |
| Space + number | Move to a buffer by index (1 - 10). |
## Comment
| Keys | Description |
--- | --- |
| (visual mode) Control + n | Toggle comment in normal and visual modes. |
## nvim-tree
| Keys | Description |
--- | --- |
| Control + p | Toggle tree. |
| Control + h/j/k/l | Navigation in nvim-tree. |
## lazy.nvim
| Keys | Description |
--- | --- |
| Space + ll | Lazy home |
## telescope
| Keys | Description |
--- | --- |
| Space + ff | Find files in current parent directory. |
| Space + fg | Grep text in current parent directory. |
## lazygit 
| Keys | Description |
--- | --- |
| Space + gg | Toggle lazygit. |
## mason
| Keys | Description |
--- | --- |
| Space + ms | Toggle mason. |
## vim-illuminate
| Keys | Description |
--- | --- |
| Alt + p | Move to the previous reference. |
| Alt + n | Move to the next reference. |
## lsp
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
| Space + vv | Show lsp information on current buffer.|
## inlay_hint (neovim)
| Keys | Description |
--- | --- |
| Space + hh | Toggle inlay hint. |
## neogen
| Keys | Description |
--- | --- |
| Space + ds | Add docstring for python. |
## ChatGPT
| Keys | Description |
--- | --- |
| Space + cp | Open interactive window to chat with ChatGPT. |
| (visual mode) ct | Translate a text block. |
| (visual mode) cs | Summarize a text block. |
| (visual mode) cd | Create docstring. |
| (visual mode) ce | Explain a code block. |
| (visual mode) cf | Fix bugs in a code block. |
| (visual mode) cg | Correct grammar in a text block. |
## Copilot
| Keys | Description |
--- | --- |
| Control + J | Autocompletion using copilot. |
## markdown-preview.nvim
| Keys | Description |
--- | --- |
| Control + m | Toggle markdown preview. |


## Others
| Keys | Description |
--- | --- |
| Space + a | Turn off highlighting. |
| Control + o | Go to [count] older cursor position in jump list. |
| Control + i | Go to [count] newer cursor position in jump list. |
