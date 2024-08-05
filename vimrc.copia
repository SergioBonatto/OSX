" Encoding and Pathogen
set encoding=UTF-8
execute pathogen#infect()

" Highlighting
hi Folded ctermbg=231 ctermfg=2
hi FoldColumn ctermbg=white ctermfg=darkred

" Basic Settings
set mouse=a
set ruler
set colorcolumn=90       " Highlight the 90th column
set ttyfast
set ttyscroll=3
set lazyredraw
set hidden
set autoread
set nowrap
set nolisp               " Stops annoying auto-indenting on .scm file
set tabstop=2            " A tab is two spaces
set expandtab
set backspace=indent,eol,start
set number               " Always show line numbers
set shiftwidth=2         " Number of spaces to use for autoindenting
set shiftround           " Use multiple of shiftwidth when indenting with '<' and '>'
set showmatch            " Show matching parenthesis
set ignorecase           " Ignore case when searching
set smartcase            " Ignore case if search pattern is all lowercase, case-sensitive otherwise
set hlsearch             " Highlight search terms
set incsearch            " Show search matches as you type
set history=1000         " Remember more commands and search history
set undolevels=1000      " Use many levels of undo
set title                " Change the terminal's title
set novisualbell         " Don't flash
set noerrorbells         " Don't beep
set nobackup
set noswapfile
set nocompatible
set viminfo='1000,f1,<500,:100,/100,h
set shortmess=atql       " No annoying start screen
set wrap                 " Enable line wrapping
set linebreak            " Wrap long lines at a character in 'breakat'
set textwidth=90         " Set text width to 90 for automatic line breaking
set wrapmargin=0
set cryptmethod=blowfish2
set formatoptions+=croqlt

" CtrlP Configuration
let g:ctrlp_by_filename = 0

" NERDTree Configuration
let NERDTreeIgnore = ['\.idr\~$', '\.git', '\.cache', '\.ibc$', '\.min.js$', '\.agdai', '\.pyc$', '\.hi$', '\.o$', '\.js_o$', '\.js_hi$', '\.dyn_o$', '\.dyn_hi$', '\.jsexe', '.*dist\/.*', '.*bin\/.*']
let NERDTreeChDirMode = 2
let NERDTreeWinSize = 24
let NERDTreeShowHidden = 1
nmap <expr> <enter> v:count1 <= 1 ? "<C-h>C<C-w>p" : "@_<C-W>99h". v:count1 ."Go<C-w>l"
nmap <leader>n :NERDTree<CR>
autocmd VimEnter * NERDTree
autocmd VimEnter * set nu
autocmd VimEnter * wincmd l
nmap <expr> <leader>t ":ClearCtrlPCache<cr>:NERDTree<cr>:set nu<cr><C-w>l"

" Escape key remapping
inoremap ☮ <esc>
vnoremap ☮ <esc>
cnoremap ☮ <esc>

" Clipboard settings
set clipboard=unnamed,unnamedplus,autoselect

" PBufferWindows
map <left> 1<C-w><
map <right> 1<C-w>>
map <up> 1<C-w>-
map <down> 1<C-w>+
noremap <C-j> <esc><C-w>j
"noremap <C-k> <esc><C-w>k
noremap <C-h> <esc><C-w>h
noremap <C-l> <esc><C-w>l
map! <C-j> <esc><C-w>j
"map! <C-k> <esc><C-w>k
map! <C-h> <esc><C-w>h
map! <C-l> <esc><C-w>l
nnoremap <C-a> :NERDTreeToggle<CR>

" Cursorline highlighting
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set cursorline

" Terminal Title
function! SetTerminalTitle()
    let titleString = expand('%:t')
    if len(titleString) > 0
        let &titlestring = expand('%:t')
        let args = "\033];".&titlestring."\007"
        let cmd = 'silent !echo -e "'.args.'"'
        execute cmd
        redraw!
    endif
endfunction
autocmd BufEnter * call SetTerminalTitle()

" Additional Settings
set autochdir
nnoremap <space> :
syntax on
set scrolloff=999
set sidescrolloff=0
map , <leader>
nnoremap <leader>j J
hi StatusLine ctermfg=lightblue ctermbg=black
hi StatusLineNC ctermfg=gray ctermbg=black
hi VertSplit ctermfg=gray ctermbg=black
map ! <leader>c<space>
nnoremap d/ :nohl<cr>
nnoremap q qa<esc>
nnoremap Q @a
nnoremap <C-u> <C-o>
"nnoremap <C-i> <C-i>
"nnoremap <TAB> <C-i>
nnoremap <S-j> 6gj
nnoremap <S-k> 6gk
vnoremap <S-j> 6gj
vnoremap <S-k> 6gk
nnoremap <leader>j J
nmap <D-h> <C-o>
nmap ( <<
nmap ) >>
"nmap <tab> >>
"nmap <S-tab> <<
map U <C-r>
nmap <C-j> <C-w>j
"nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $
nnoremap + zr:echo 'foldlevel: ' . &foldlevel<cr>
nnoremap - zm:echo 'foldlevel: ' . &foldlevel<cr>
nnoremap <leader>f zO
nnoremap <leader>d zo
nnoremap <leader>s zc
nnoremap <leader>a zC
set comments+=:--

" Undo settings
set undofile
set undodir=~/.vim/undo
set foldlevel=0
autocmd Syntax * normal zR
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" Rust clipboard command
let g:rust_clip_command = 'xclip -selection clipboard'

" Colorscheme
if has('termguicolors')
    set termguicolors
endif
set background=light
let g:gruvbox_italic=1
colorscheme gruvbox
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1

" Cursorline highlighting in Insert mode
set cursorline
syntax enable
filetype plugin indent on

" NERDCommenter settings
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" IndentLine settings
let g:indentLine_setColors = 1
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_char = "¦"

" Vim DevIcons settings
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_vimfiler = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_startify = 1
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = 'λ'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Map leader key
map <leader>, 0y$:r!<C-r>"<CR>

" CtrlP setup
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction

if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif

" Default mappings
noremap m %
set runtimepath^=~/.vim/bundle/ag

" Split window settings
set splitright
set diffopt+=vertical
silent! set splitvertical
if v:errmsg != ''
  cabbrev split vert split
  cabbrev hsplit split
  cabbrev help vert help
  noremap <C-w>] :vert botright wincmd ]<CR>
  noremap <C-w><C-]> :vert botright wincmd ]<CR>
else
  cabbrev hsplit hor split
endif

let g:netrw_altv = 1

" JavaScript and Markdown settings
let g:javascript_plugin_jsdoc = 1
let vim_jsx_pretty_colorful_config = 1
let vim_markdown_preview_github = 1
let vim_markdown_preview_toggle = 2
let vim_markdown_preview_browser = 'Arc'

" Clipboard settings
set clipboard=unnamed
set guifont=Fira\ Code\ iScript:h14
highlight Comment cterm=italic
autocmd VimEnter * NERDTree | wincmd p
