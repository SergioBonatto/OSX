" =============================================================================
" Core Settings
" =============================================================================

" Basic settings
set nocompatible
syntax enable
filetype plugin indent on
set encoding=UTF-8
set fileencoding=UTF-8

" Performance
set lazyredraw
set ttyfast
set regexpengine=0
set synmaxcol=200
set updatetime=300
set timeoutlen=500
set redrawtime=10000

" Editor behavior
set autoread
set hidden
set history=1000
set undolevels=1000
set path+=**
set wildmenu
set wildmode=list:longest,full
set wildignore+=*/node_modules/*,*.o,*.pyc,*.DS_Store,*/.git/*,*/dist/*,*/build/*
set clipboard=unnamed,unnamedplus
set mouse=a
set backspace=indent,eol,start
set formatoptions+=croqltj

" Security
set secure
set noswapfile
set nobackup
set cryptmethod=blowfish2

" Undo
set undofile
set undodir=~/.vim/undo

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

" Visual
set number
set cursorline
set showmatch
set colorcolumn=90
set scrolloff=8
set sidescrolloff=8
set signcolumn=yes
set linebreak
set wrap
set nolist
set termguicolors
set ambiwidth=single
set display=lastline
set fillchars=vert:\│,fold:-

" Splits
set splitright
set splitbelow
set diffopt+=vertical

" Statusline
set noshowmode
set noruler
set laststatus=2
