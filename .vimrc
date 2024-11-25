let g:ale_set_highlights = 0
execute pathogen#infect()
syntax on
filetype plugin on


" =============================================================================
" Basic Configuration
" =============================================================================
set encoding=UTF-8
set mouse=a
set ruler
set ttyfast
set ttyscroll=3
set lazyredraw
set hidden
set autoread
set nowrap
set nolisp               " Stops auto-indenting on .scm files
set tabstop=2            " A tab is two spaces
set expandtab
set shiftwidth=2         " Number of spaces for auto-indenting
set shiftround           " Indent with multiple of shiftwidth
set backspace=indent,eol,start
set number               " Show line numbers
set showmatch            " Show matching parenthesis
set ignorecase           " Ignore case in search
set smartcase            " Smart case in search
set hlsearch             " Highlight search terms
set incsearch            " Incremental search
set history=1000         " Increase history size
set undolevels=1000      " Increase undo levels
set title                " Change terminal title
set novisualbell         " Disable visual bell
set noerrorbells         " Disable error bells
set nobackup             " Disable backup files
set noswapfile           " Disable swap files
set nocompatible
set viminfo='1000,f1,<500,:100,/100,h
set shortmess=atql       " No annoying start screen
set wrap                 " Enable line wrapping
set linebreak            " Wrap long lines at characters in 'breakat'
set textwidth=90         " Set text width to 90 for automatic line breaking
set wrapmargin=0
set cryptmethod=blowfish2
set formatoptions+=croqlt
set autochdir            " Auto change working directory
set scrolloff=999        " Scroll offset
set sidescrolloff=0
set clipboard=unnamed,unnamedplus,autoselect
set comments+=:--
set nofoldenable

" =============================================================================
" Pathogen Initialization
" =============================================================================
" execute pathogen#infect()

" filetype plugin on
" =============================================================================
" Highlighting
" =============================================================================
hi Folded ctermbg=231 ctermfg=2
hi FoldColumn ctermbg=white ctermfg=darkred
hi StatusLine ctermfg=lightblue ctermbg=black
hi StatusLineNC ctermfg=gray ctermbg=black
hi VertSplit ctermfg=gray ctermbg=black
highlight Comment cterm=italic

" =============================================================================
" CtrlP Configuration
" =============================================================================
let g:ctrlp_by_filename = 0

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

" =============================================================================
" NERDTree Configuration
" =============================================================================
let NERDTreeIgnore = ['node_modules', '^\.', '\.idr\~$', '\.git', '\.cache', '\.ibc$', '\.min.js$', '\.agdai', '\.pyc$', '\.hi$', '\.o$', '\.js_o$', '\.js_hi$', '\.dyn_o$', '\.dyn_hi$', '\.jsexe', '.*dist\/.*', '.*bin\/.*']
let NERDTreeChDirMode = 2
let NERDTreeWinSize = 24
let NERDTreeShowHidden = 1

autocmd VimEnter * NERDTree
autocmd VimEnter * set nu
autocmd VimEnter * wincmd l

" =============================================================================
" Escape Key Remapping
" =============================================================================
inoremap ☮ <esc>
vnoremap ☮ <esc>
cnoremap ☮ <esc>

" =============================================================================
" PBufferWindows
" =============================================================================
map <left> 1<C-w><
map <right> 1<C-w>>
map <up> 1<C-w>-
map <down> 1<C-w>+
noremap <C-j> <esc><C-w>j
noremap <C-h> <esc><C-w>h
noremap <C-l> <esc><C-w>l

" =============================================================================
" Cursorline Highlighting
" =============================================================================
set cursorline
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

" =============================================================================
" Terminal Title Functionality
" =============================================================================
function! SetTerminalTitle()
    let titleString = expand('%:t')
    if len(titleString) > 0
        let &titlestring = titleString
        let cmd = 'silent !echo -e "\033];'.&titlestring.'\007"'
        execute cmd
        redraw!
    endif
endfunction
autocmd BufEnter * call SetTerminalTitle()

" =============================================================================
" Undo Settings
" =============================================================================
set undofile
set undodir=~/.vim/undo
set foldlevel=0
autocmd Syntax * normal zR
autocmd BufReadPost * normal zR

" =============================================================================
" Close NERDTree if Only Window Left
" =============================================================================
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" =============================================================================
" Rust Clipboard Command
" =============================================================================
let g:rust_clip_command = 'xclip -selection clipboard'

" =============================================================================
" Colorscheme
" =============================================================================
set termguicolors
set background=light " for the light version
let ayucolor="light"  " for light version of theme
" colorscheme ayu
colorscheme Bonatto
" if has('termguicolors')
"     set termguicolors
" endif
" set background=light
" let g:gruvbox_italic=1
" colorscheme gruvbox
" let g:airline_theme = 'statusline'
let g:airline_theme='bonatto'


" let g:airline_theme = 'ayu'
" let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
let g:ale_set_highlights = 0
let g:airline#extensions#ale#enabled = 1
let g:ale_floating_window_border = []

let g:ale_sign_column_always = 0

highlight ALEErrorSign guifg=#FF0000 ctermfg=red
highlight ALEWarningSign guifg=#FFA500 ctermfg=yellow

" =============================================================================
" NERDCommenter Settings
" =============================================================================
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" Atualiza o NERDTree automaticamente
autocmd BufWritePost * NERDTreeFocus | execute 'normal r' | wincmd p


" NERDComment
:map ! <leader>c<space>
" =============================================================================
" IndentLine Settings
" =============================================================================
let g:indentLine_setColors = 1
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_char = "¦"

" =============================================================================
" Vim DevIcons Settings
" =============================================================================
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

" =============================================================================
" Leader Key and Mappings
" =============================================================================
let mapleader = ","
nmap <leader>n :NERDTreeToggle<CR>
noremap <leader>j J
nnoremap d/ :nohl<CR>
nnoremap q qa<esc>
nnoremap Q @a
nnoremap <C-u> <C-o>

" Mapeamentos atualizados para j e k (6 linhas de movimento)
nnoremap <S-j> 6gj
nnoremap <S-k> 6gk
vnoremap <S-j> 6gj
vnoremap <S-k> 6gk

" Novos mapeamentos para h e l (início e fim da palavra)
nnoremap <S-h> 6hb
nnoremap <S-l> 6le
vnoremap <S-h> b
vnoremap <S-l> e

nnoremap <Leader>k :!kindcoder<CR>
nnoremap <Leader>t :!ts-deps<CR>
nnoremap <Leader>c :!csh<CR>
nnoremap <Leader>h :!holefill % %<CR>
nnoremap <Leader>f :!refactor %<CR>
nnoremap <Leader>d :!koder ~/Work/HOC/monobook/<CR>
nnoremap <Leader>s :!chatsh<CR>
nnoremap <Leader>x :!codocx<CR>
nnoremap <Leader>e :!codocx -t english<CR>
nnoremap <Leader>a :!agda2kind %<CR>
nnoremap <Leader>, 0y$:r!<C-r>"<CR>

nnoremap <C-a> :NERDTreeToggle<CR>
vnoremap <S-s> :sort<CR>

" =============================================================================
" Default Mappings
" =============================================================================
noremap m %
nmap <D-h> <C-o>
nmap ( <<
nmap ) >>
map U <C-r>

map ! <leader>c<space>
" =============================================================================
" Split Window Settings
" =============================================================================
set splitright
set diffopt+=vertical
silent! set splitvertical
if v:errmsg != ''
  cabbrev split vert split
  cabbrev hsplit split
  cabbrev help vert help
  noremap <C-w>] :vert botright wincmd ]<CR>
  noremap <C-w><C-]> :vert botright wincmd ]<CR>
endif

source ~/.vim/statusline.vim
