call plug#begin('~/.vim/plugged')

" ale code analysis
" Plug 'dense-analysis/ale'

" Auto create pairs for special characters
" Plug 'jiangmiao/auto-pairs'

" Plug 'tpope/vim-surround'

" Auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Text colors
Plug 'morhetz/gruvbox'
" Vim color
Plug 'norcalli/nvim-colorizer.lua'

" Nerd Tree
Plug 'preservim/nerdtree'

" Commenter
Plug 'preservim/nerdcommenter'

" Check vim startup time
Plug 'tweekmonster/startuptime.vim'

" Vim airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" searching
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }

" NerdTree git highlighter
Plug 'Xuyuanp/nerdtree-git-plugin'

" NerdTree icon
Plug 'ryanoasis/vim-devicons'

call plug#end()

set mouse=a

set encoding=utf-8
set number relativenumber
set noswapfile
set scrolloff=7
set backspace=indent,eol,start

syntax enable

" set expandtab
" set tabstop=2
" set softtabstop=2
" set shiftwidth=2
" set autoindent

set fileformat=unix

let mapleader = ' '

colorscheme gruvbox

" NERDCommenter
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 0
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" NERDTree
let NERDTreeQuitOnOpen=0
let g:NERDTreeMinimalUI=1
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <C-f> :NERDTreeToggle<CR>
map <C-h> <C-w>h
map <C-l> <C-w>l
" map <C-j> <C-w>j
" map <C-k> <C-w>k

" Nerdtree git Highlighter
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }


" COC config
" \ 'coc-eslint',
" \ 'coc-prettier',
let g:coc_global_extensions = [
      \ 'coc-snippets',
      \ 'coc-pairs',
      \ 'coc-json',
      \ 'coc-pyright'
      \ ]

" python3
let g:python3_host_skip_check=1
let g:python3_host_prog = substitute(system("which python3"), '\n\+$', '', '')
let g:deoplete#sources#jedi#statement_length = 50

" python2
let g:loaded_python_provider = 0
let g:python2_host_prog = ''
let g:python2_host_skip_check=1

" ruby
let g:loaded_ruby_provider = 0

" node.js
let g:loaded_node_provider = 0

" perl
let g:loaded_perl_provider = 0

" Auto pairs
" let g:AutoPairsShortcutFastwrap = "<C-A>"

" Ale
" let g:ale_disable_lsp = 1
" let g:ale_sign_column_always = 1
" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '--'
" let g:ale_linters = {'python': ['pylint']}
" let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['yapf']}
" let g:ale_fix_on_save = 0
" let g:ale_disable_lsp = 1

" vim airline
let g:airline#extensions#branch#enabled=1
let g:airline_powerline_fonts = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" prettier
" command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

source $HOME/.config/nvim/coc.vim
