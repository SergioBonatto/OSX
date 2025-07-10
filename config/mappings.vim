" =============================================================================
" Key Mappings
" =============================================================================

let mapleader = ","

" === Movement ===
" Enhanced line movement
nnoremap <S-j> 6gj
nnoremap <S-k> 6gk
vnoremap <S-j> 6gj
vnoremap <S-k> 6gk

" Word navigation
nnoremap <S-h> b
nnoremap <S-l> e
vnoremap <S-h> b
vnoremap <S-l> e

" Window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Window resizing
map <Left> <C-w><
map <Right> <C-w>>
map <Up> <C-w>-
map <Down> <C-w>+

" === Editing ===
" Keep selection after indent
vnoremap < <gv
vnoremap > >gv

" Quick actions
map U <C-r>
vnoremap <S-s> :sort<CR>
noremap m %

" Indent shortcuts
nmap ( <<
nmap ) >>

" === Plugin shortcuts ===
" NERDTree
nnoremap <C-a> :NERDTreeToggle<CR>

" NERDCommenter - Comment toggle with !
nnoremap ! <Plug>NERDCommenterToggle
vnoremap ! <Plug>NERDCommenterToggle

" Alternative comment mappings
nnoremap <Leader>/ <Plug>NERDCommenterToggle
vnoremap <Leader>/ <Plug>NERDCommenterToggle

nnoremap <Leader>c <Plug>NERDCommenterToggle
vnoremap <Leader>c <Plug>NERDCommenterToggle

" Multi-line comment mappings
nnoremap <Leader>cm <Plug>NERDCommenterMinimal
vnoremap <Leader>cm <Plug>NERDCommenterMinimal
nnoremap <Leader>cs <Plug>NERDCommenterSexy
vnoremap <Leader>cs <Plug>NERDCommenterSexy
nnoremap <Leader>cb <Plug>NERDCommenterAlternate
vnoremap <Leader>cb <Plug>NERDCommenterAlternate

" === Custom commands ===
nnoremap <Leader>k :!kindcoder<CR>
nnoremap <Leader>t :!ts-deps<CR>
nnoremap <Leader>h :!holefill % %<CR>
nnoremap <Leader>f :!refactor %<CR>
nnoremap <Leader>s :!chatsh<CR>
nnoremap <Leader>a :!agda2kind %<CR>
