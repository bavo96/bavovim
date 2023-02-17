call plug#begin('~/.vim/plugged')

" Smooth scroll
Plug 'karb94/neoscroll.nvim'

" Auto create pairs for special characters
Plug 'jiangmiao/auto-pairs'

" Delete/change/add surrounding in pairs
Plug 'tpope/vim-surround'

" Auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Nerd Tree
Plug 'preservim/nerdtree'

" Commenter
Plug 'preservim/nerdcommenter'

" Check vim startup time
Plug 'dstein64/vim-startuptime'

" searching
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }

" NerdTree icon
Plug 'ryanoasis/vim-devicons'

" Tabline (at the top)
Plug 'nvim-tree/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

" Vim airline (at the bottom)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Show indent
Plug 'lukas-reineke/indent-blankline.nvim'

" Text color
" Plug 'morhetz/gruvbox'

" Nvim color
" Plug 'norcalli/nvim-colorizer.lua'

call plug#end()

" ##### VIM SECTION #####

" colorscheme gruvbox
syntax enable

set mouse=a
set encoding=utf-8
set number relativenumber
set noswapfile
set scrolloff=7
set backspace=indent,eol,start

" Set tab and indent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent

set fileformat=unix

" Set space as mapleader
let mapleader = ' '
nnoremap <SPACE> <Nop>

" ##### VIM SECTION ##### 

" NERDCommenter
nmap <C-.> <Plug>NERDCommenterToggle
vmap <C-.> <Plug>NERDCommenterToggle<CR>gv
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
let NERDTreeShowHidden=1
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <C-p> :NERDTreeToggle<CR>
map <C-h> <C-w>h
map <C-l> <C-w>l

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

" vim airline
let g:airline#extensions#branch#enabled=1
let g:airline_powerline_fonts = 1

" prettier
" command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

" Smooth scroll
lua require('neoscroll').setup()

source $HOME/.config/nvim/coc.vim
