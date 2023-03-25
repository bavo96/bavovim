call plug#begin('~/.vim/plugged')

" Auto create pairs for special characters
Plug 'jiangmiao/auto-pairs'

" Delete/change/add surrounding in pairs
Plug 'tpope/vim-surround'

" Nerd Tree
Plug 'preservim/nerdtree'

" Commenter
Plug 'preservim/nerdcommenter'

" Check vim startup time
Plug 'dstein64/vim-startuptime'

" searching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" NerdTree icon
Plug 'ryanoasis/vim-devicons'

" NerdTree color
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'johnstef99/vim-nerdtree-syntax-highlight'

" Tabline (at the top)
Plug 'nvim-tree/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

" Vim airline (at the bottom)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Show indent
Plug 'lukas-reineke/indent-blankline.nvim'

" Nvim color
Plug 'ellisonleao/gruvbox.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
"" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Git
" Plug 'tpope/vim-fugitive'
" Plug 'APZelos/blamer.nvim'
Plug 'f-person/git-blame.nvim'

call plug#end()

" ##### VIM SECTION #####

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

" Turn off auto add a comment when newline
set formatoptions-=ro

set fileformat=unix

" Set conceal level in vim to fix square bracket in vim-devicons
set conceallevel=2

" Set space as mapleader
let mapleader = ' '
" nnoremap <SPACE> <Nop>

" ##### VIM SECTION ##### 

" NERDCommenter
filetype plugin on
nmap <leader>cc <plug>NERDComToggleComment
vmap <leader>cc <plug>NERDComToggleComment gv

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
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
let g:NERDTreeFileExtensionHighlightFullName = 1
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <C-p> :NERDTreeToggle<CR>
map <C-h> <C-w>h
map <C-l> <C-w>l

" Auto pairs
" let g:AutoPairsShortcutFastwrap = "<C-A>"

" Vim airline
let g:airline#extensions#branch#enabled=1
let g:airline_powerline_fonts = 1

" Vim devicons
let g:webdevicons_conceal_nerdtree_brackets=1
let g:devicons_enable_signs = 0
"" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

" Import lua configuration
lua require('init')



