syntax on
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
set ttimeoutlen=0
set tabstop=4
set shiftwidth=4
set expandtab
set ai
set number
set nohlsearch
set incsearch
set ruler
set belloff=all
set scrolloff=6
set laststatus=2
set nocompatible
set signcolumn=yes

call plug#begin()

Plug 'sainnhe/gruvbox-material'
Plug 'sheerun/vim-polyglot'

" LSP stuff
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" LSP snippets
" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'
" Plug 'rafamadriz/friendly-snippets'

call plug#end()

set background=dark
set termguicolors
colorscheme gruvbox-material
" font:source code pro

" More LSP stuff
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" Auto closing stuff
" inoremap { {}<Esc>ha

" Old Theme
" tokyonight from ghifarit is not being updated anymore
" Plug 'ghifarit53/tokyonight-vim'
" let g:tokyonight_style = 'night'
" colorscheme tokyonight
