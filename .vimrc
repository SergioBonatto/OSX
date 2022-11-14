set encoding=UTF-8

execute pathogen#infect()

"256 colors
" set t_Co=256
" set t_AB=^[[48;5;%dm
" set t_AF=^[[38;5;%dm

function! s:NextNonBlankLine(lnum)
    let numlines = line('$')
    let current = a:lnum + 1
    while current <= numlines
        if getline(current) =~? '\v\S'
            return current
        endif
        let current += 1
    endwhile
    return -2
endfunction
function! s:IndentLevel(lnum)
    if &ft == 'chaos'
        if (a:lnum == 1)
            return 0
        else
            return (getline(a:lnum)=~?'\v^::' ? 0 : indent(a:lnum) / &shiftwidth + 1)
        endif
    else
        return indent(a:lnum) / &shiftwidth + (getline(a:lnum)=~?'^\s*}' ? 1 : 0)
    endif
endfunction
function! GetPotionFold(lnum)
    if getline(a:lnum) =~? '\v^\s*$'
        return '-1'
    endif
    let this_indent = <SID>IndentLevel(a:lnum)
    let next_indent = <SID>IndentLevel(<SID>NextNonBlankLine(a:lnum))
    let prev_indent = <SID>IndentLevel(<SID>PrevNonBlankLine(a:lnum))
    if next_indent == this_indent
        return this_indent
    elseif next_indent < this_indent
        return this_indent
    elseif next_indent > this_indent
        return '>' . next_indent
    endif
endfunction
function! NeatFoldText()
    let line = getline(v:foldstart)
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
    let foldchar = ' '
    let foldtextstart = strpart(line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 6)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
    "return repeat('  ',v:foldlevel) . foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()

hi Folded ctermbg=231 ctermfg=2
hi FoldColumn ctermbg=white ctermfg=darkred

set mouse=a
set ruler
" set colorcolumn=90
set ttyfast
set ttyscroll=3
set lazyredraw
set hidden
set nowrap
set autoread
" set wrap nolist linebreak
" set nosmartindent                        " TODO: remove this line if things go wrong
set nolisp                               " stops annoying auto-indenting on .scm file
set tabstop=2                            " a tab is four spaces
set expandtab                            "
set backspace=indent,eol,start           " allow backspacing over everything in insert mode
set autoindent                           " always set autoindenting on
set number                               " always show line numbers
set shiftwidth=2                         " number of spaces to use for autoindenting
set shiftround                           " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch                            " set show matching parenthesis
set ignorecase                           " ignore case when searching
set smartcase                            " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab                             " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch                             " highlight search terms
set incsearch                            " show search matches as you type
set history=1000                         " remember more commands and search history
set undolevels=1000                      " use many muchos levels of undo
set title                                " change the terminal's title
set novisualbell                         " don't flash
set noerrorbells                         " don't beep
set nobackup
set noswapfile
set nocompatible
set viminfo='1000,f1,<500,:100,/100,h  "
set shortmess=atql " no annoying start screen
" set linebreak
" set wrap linebreak
" set showbreak=↪
set nolist  " list disables linebreak
" set textwidth=80
" set wrapmargin=0
set cryptmethod=blowfish2

" CtrlP stuff
"let g:ctrlp_match_func = {'match' : 'cpsm#CtrlPMatch' }
"let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_by_filename = 0
:map <expr> <space> ":CtrlP ".getcwd()."<cr>"
:noremap j gj
:noremap k gk

:nnoremap <expr> r ':!time kind %<cr>'
" The greatest
:nnoremap <expr> r ':!clear<cr>:w!<cr>'.(
    \ expand('%:p')=='/Users/v/mist/main.js' ? ':!electron . --rpc ~/Library/Ethereum/testnet/geth.ipc<cr>' :
    \ expand('%:t')=='test.js' ? ':!mocha<cr>' :
    \ &ft=='caramel'    ? ':!time mel main<cr>' :
    \ &ft=='ocaml'      ? ':!ocamlc -o %:r %<cr>:!./%:r<cr>' :
    \ &ft=='factor'     ? ':!~/factor/factor %<cr>' :
    \ &ft=='python'     ? ':!time python3 %<cr>' :
    \ &ft=='coc'        ? ':!time (coc type %:r; coc norm %:r)<cr>' :
    \ &ft=='scheme'     ? ':!time scheme --script %<cr>' :
    \ &ft=='elm'        ? '<esc>:!clear<cr>:w!<cr>:!elm % -r elm-runtime.js<cr>:!osascript ~/.vim/refresh.applescript &<cr>' :
    \ &ft=='racket'     ? ':!racket %<cr>' :
    \ &ft=='haskell'    ? ':!time runghc --ghc-arg=-freverse-errors %<cr>' :
    "\ &ft=='haskell'    ? ':!stack runghc %<cr>' :
    \ &ft=='rust'       ? ':!time RUST_BACKTRACE=1 cargo lrun<cr>' :
    \ &ft=='go'         ? ':!time go run %<cr>' :
    \ &ft=='purescript' ? ':!pulp run <cr>' :
    \ &ft=='dvl'        ? ':!dvl run %<cr>' :
    \ &ft=='ultimate'   ? ':!time ult %<cr>' :
    \ &ft=='lambda'     ? ':!time absal %<cr>' :
    \ &ft=='javascript' ? ':!time node %<cr>' :
    \ &ft=='typescript' ? ':!time deno --unstable run --allow-all %<cr>' :
    \ &ft=='moon'       ? ':!time moon run %:r<cr>' :
    \ &ft=='escoc'      ? ':!time escoc %:r<cr>' :
    \ &ft=='eatt'       ? ':!time eatt -itneTNRx %:r<cr>' :
    \ &ft=='eac'        ? ':!time eac %:r<cr>' :
    \ &ft=='fmfm'       ? ':!time fmjs %<cr>' :
    \ &ft=='formality'  ? ':!time fmjs %<cr>' :
    \ &ft=='formcore'   ? ':!time fmc %<cr>' :
    \ &ft=='kind'       ? ':!time kind %<cr>' :
    \ &ft=='kind2'      ? ':!time kind2 check %<cr>' :
    \ &ft=='type'       ? ':!time kind2 derive %<cr>' :
    \ &ft=='kindelia'   ? ':!time kindelia run %<cr>' :
    \ &ft=='lambolt'    ? ':!time hvm % ts<cr>' :
    \ &ft=='hvm'        ? ':!time hvm run % 2<cr>' :
    \ &ft=='sic'        ? ':!time sic -s %<cr>' :
    \ &ft=='morte'      ? ':!time echo $(cat %) \| morte<cr>' :
    \ &ft=='swift'      ? ':!time swift %<cr>' :
    \ &ft=='solidity'   ? ':!run_solidity %<cr>' :
    \ &ft=='idris2'     ? ':!time idris2 % -o %:r<cr>:!time ./build/exec/%:r<cr>' :
    \ &ft=='lean'       ? ':!time lean %<cr>' :
    \ &ft=='c'          ? ':!clang % -o %:r<cr>:!time ./%:r<cr>' :
    \ &ft=='cuda'       ? ':!scp % victu:~/cuda<CR>:!ssh victu /usr/local/cuda/bin/nvcc -O3 /home/v/cuda/% -o /home/v/cuda/%:r<CR>:!ssh victu time /home/v/cuda/%:r<cr>' :
    \ &ft=='cpp'        ? ':!clang++ -std=c++11 -O3 % -o %:r<cr>:!time ./%:r<cr>' :
    \ &ft=='agda'       ? ':!agda -i src %<cr>' :
    \ &ft=='ls'         ? ':!lsc -c %<cr>:!node %:r.js<cr>' :
    \ &ft=='lispell'    ? ':!node ~/Viclib/lispedia/bin/lis.js reduce %:r<cr>' :
    \ ':!time cc %<cr>')

:nnoremap <expr> R ':!clear<cr>:w!<cr>'.(
    \ expand('%:p')=='/Users/v/mist/main.js' ? ':!electron . --rpc ~/Library/Ethereum/testnet/geth.ipc<cr>' :
    \ expand('%:t')=='test.js' ? ':!mocha<cr>' :
    \ &ft=='caramel'    ? ':!time mel main<cr>' :
    \ &ft=='ocaml'      ? ':!ocamlc -o %:r %<cr>:!./%:r<cr>' :
    \ &ft=='factor'     ? ':!~/factor/factor %<cr>' :
    \ &ft=='python'     ? ':!time python %<cr>' :
    \ &ft=='coc'        ? ':!time (coc type %:r; coc norm %:r)<cr>' :
    \ &ft=='scheme'     ? ':!csc %<cr>:!time ./%:r<cr>' :
    \ &ft=='elm'        ? '<esc>:!clear<cr>:w!<cr>:!elm % -r elm-runtime.js<cr>:!osascript ~/.vim/refresh.applescript &<cr>' :
    \ &ft=='racket'     ? ':!racket %<cr>' :
    "\ &ft=='haskell'    ? ':!stack run<cr>' :
    \ &ft=='haskell'    ? ':!time ghc -O2 % -o .tmp; time ./.tmp 0; rm %:r.hi %:r.o .tmp<cr>' :
    \ &ft=='rust'       ? ':!time cargo lrun --release<cr>' :
    \ &ft=='go'         ? ':!time go run %<cr>' :
    \ &ft=='purescript' ? ':!pulp run <cr>' :
    \ &ft=='dvl'        ? ':!dvl run %<cr>' :
    \ &ft=='lambda'     ? ':!time absal -s %<cr>' :
    \ &ft=='javascript' ? ':!npm run build<cr>' :
    \ &ft=='typescript' ? ':!time deno --unstable run --reload --allow-all %<cr>' :
    "\ &ft=='typescript' ? ':!npm run build<cr>' :
    \ &ft=='html'       ? ':!npm run build<cr>' :
    \ &ft=='eatt'       ? ':!time eatt %:r<cr>' :
    \ &ft=='fmfm'       ? ':!time fmjs %:r --run<cr>' :
    \ &ft=='formality'  ? ':!time fmjs %:r --run<cr>' :
    \ &ft=='kind'       ? ':!time kind ' . substitute(expand("%:r"),"/",".","g") . ' --run<cr>' :
    \ &ft=='kind2'      ? ':!time kind2 eval %<cr>' :
    \ &ft=='kindelia'   ? ':!time kindelia post % 127.0.0.1:42000<cr>' :
    \ &ft=='lambolt'    ? ':!time lam % c<cr>' :
    \ &ft=='hvm'        ? ':!hvm c %; clang -O2 %:r.c -o %:r; time ./%:r 2; rm %:r %:r.c<cr>' :
    "\ &ft=='formality'  ? ':!time fmio %:r<cr>' :
    \ &ft=='eac'        ? ':!time eac %:r<cr>' :
    \ &ft=='formcore'   ? ':!time fmio %:r<cr>' :
    \ &ft=='moon'       ? ':!time moon run %:r<cr>' :
    \ &ft=='sic'        ? ':!time sic -s -B %<cr>' :
    \ &ft=='morte'      ? ':!time echo $(cat %) \| morte<cr>' :
    \ &ft=='swift'      ? ':!time swift %<cr>' :
    \ &ft=='solidity'   ? ':!truffle deploy<cr>' :
    \ &ft=='idris2'     ? ':!idris2 % -o %:r<cr>:!time ./build/exec/%:r<cr>' :
    \ &ft=='c'          ? ':!clang -O3 % -o %:r<cr>:!time ./%:r<cr>' :
    \ &ft=='cuda'       ? ':!rm %:r; nvcc -O3 % -o %:r<cr>:!time ./%:r<cr>' :
    \ &ft=='cpp'        ? ':!clang++ -O3 % -o %:r<cr>:!time ./%:r<cr>' :
    \ &ft=='agda'       ? ':!agda -i src %<cr>' :
    \ &ft=='ls'         ? ':!lsc -c %<cr>:!node %:r.js<cr>' :
    \ &ft=='lispell'    ? ':!node ~/Viclib/lispedia/bin/lis.js reduce %:r<cr>' :
    \ ':!time cc %<cr>')

:nnoremap <expr> <leader>r ':!clear<cr>:w!<cr>'.(
    \ expand('%:p')=='/Users/v/mist/main.js' ? ':!electron . --rpc ~/Library/Ethereum/testnet/geth.ipc<cr>' :
    \ expand('%:t')=='test.js' ? ':!mocha<cr>' :
    \ &ft=='caramel'    ? ':!time mel main<cr>' :
    \ &ft=='ocaml'      ? ':!ocamlc -o %:r %<cr>:!./%:r<cr>' :
    \ &ft=='factor'     ? ':!~/factor/factor %<cr>' :
    \ &ft=='python'     ? ':!time python %<cr>' :
    \ &ft=='coc'        ? ':!time (coc type %:r; coc norm %:r)<cr>' :
    \ &ft=='scheme'     ? ':!csc %<cr>:!time ./%:r<cr>' :
    \ &ft=='elm'        ? '<esc>:!clear<cr>:w!<cr>:!elm % -r elm-runtime.js<cr>:!osascript ~/.vim/refresh.applescript &<cr>' :
    \ &ft=='racket'     ? ':!racket %<cr>' :
    \ &ft=='haskell'    ? ':!stack run<cr>' :
    \ &ft=='rust'       ? ':!time cargo +nightly lrun --release<cr>' :
    \ &ft=='go'         ? ':!time go run %<cr>' :
    \ &ft=='purescript' ? ':!pulp run <cr>' :
    \ &ft=='dvl'        ? ':!dvl run %<cr>' :
    \ &ft=='lambda'     ? ':!time absal -s %<cr>' :
    \ &ft=='javascript' ? ':!npm run build<cr>' :
    \ &ft=='typescript' ? ':!npm run build<cr>' :
    \ &ft=='html'       ? ':!npm run build<cr>' :
    \ &ft=='eatt'       ? ':!time eatt %:r<cr>' :
    \ &ft=='formality'  ? ':!time fm %<cr>' :
    \ &ft=='formcore'   ? ':!time fmcjs %:r<cr>' :
    \ &ft=='hvm'        ? ':!cargo install --path .<cr>' :
    \ &ft=='kind'       ? ':!node /Users/v/vic/dev/Kind/web/build.js %:r<cr>' :
    \ &ft=='kind2'      ? ':!time kind2 run %<cr>' :
    \ &ft=='eac'        ? ':!time eac %:r<cr>' :
    \ &ft=='moon'       ? ':!time moon run %:r<cr>' :
    \ &ft=='sic'        ? ':!time sic -s -B %<cr>' :
    \ &ft=='morte'      ? ':!time echo $(cat %) \| morte<cr>' :
    \ &ft=='swift'      ? ':!time swift %<cr>' :
    \ &ft=='solidity'   ? ':!truffle deploy<cr>' :
    \ &ft=='idris2'     ? ':!idris2 % -o %:r<cr>:!time ./%:r<cr>' :
    \ &ft=='c'          ? ':!clang -O3 -Wall % -o %:r<cr>:!time ./%:r<cr>' :
    \ &ft=='cuda'       ? ':!rm %:r; nvcc -O3 % -o %:r<cr>:!time ./%:r<cr>' :
    \ &ft=='cpp'        ? ':!clang++ -O3 % -o %:r<cr>:!time ./%:r<cr>' :
    \ &ft=='agda'       ? ':!agda -i src %<cr>' :
    \ &ft=='ls'         ? ':!lsc -c %<cr>:!node %:r.js<cr>' :
    \ &ft=='lispell'    ? ':!node ~/Viclib/lispedia/bin/lis.js reduce %:r<cr>' :
    \ ':!time cc %<cr>')

:nnoremap <expr> <leader>R ':!clear<cr>:w!<cr>'.(
    \ expand('%:p')=='/Users/v/mist/main.js' ? ':!electron . --rpc ~/Library/Ethereum/testnet/geth.ipc<cr>' :
    \ expand('%:t')=='test.js' ? ':!mocha<cr>' :
    \ &ft=='caramel'    ? ':!time mel main<cr>' :
    \ &ft=='ocaml'      ? ':!ocamlc -o %:r %<cr>:!./%:r<cr>' :
    \ &ft=='factor'     ? ':!~/factor/factor %<cr>' :
    \ &ft=='python'     ? ':!time python %<cr>' :
    \ &ft=='coc'        ? ':!time (coc type %:r; coc norm %:r)<cr>' :
    \ &ft=='scheme'     ? ':!csc %<cr>:!time ./%:r<cr>' :
    \ &ft=='elm'        ? '<esc>:!clear<cr>:w!<cr>:!elm % -r elm-runtime.js<cr>:!osascript ~/.vim/refresh.applescript &<cr>' :
    \ &ft=='racket'     ? ':!racket %<cr>' :
    \ &ft=='haskell'    ? ':!stack run<cr>' :
    \ &ft=='rust'       ? ':!time cargo +nightly run --release<cr>' :
    \ &ft=='go'         ? ':!time go run %<cr>' :
    \ &ft=='purescript' ? ':!pulp run <cr>' :
    \ &ft=='dvl'        ? ':!dvl run %<cr>' :
    \ &ft=='lambda'     ? ':!time absal -s %<cr>' :
    \ &ft=='javascript' ? ':!npm run build<cr>' :
    \ &ft=='typescript' ? ':!npm run build<cr>' :
    \ &ft=='html'       ? ':!npm run build<cr>' : \ &ft=='eatt'       ? ':!time eatt %:r<cr>' : \ &ft=='formality'  ? ':!time fmio %:r<cr>' : \ &ft=='formcore'   ? ':!time fmcrun main<cr>' : \ &ft=='kind'       ? ':!node /Users/v/vic/dev/Kind/web/build.js %:r<cr>' : \ &ft=='eac'        ? ':!time eac %:r<cr>' : \ &ft=='moon'       ? ':!time moon run %:r<cr>' : \ &ft=='sic'        ? ':!time sic -s -B %<cr>' : \ &ft=='morte'      ? ':!time echo $(cat %) \| morte<cr>' : \ &ft=='swift'      ? ':!time swift %<cr>' : \ &ft=='solidity'   ? ':!truffle deploy<cr>' : \ &ft=='idris2'     ? ':!idris2 % -o %:r<cr>:!time ./%:r<cr>' : \ &ft=='c'          ? ':!clang -O3 % -o %:r<cr>:!time ./%:r<cr>' : \ &ft=='cuda'       ? ':!rm %:r; nvcc -O3 % -o %:r<cr>:!time ./%:r<cr>' : \ &ft=='cpp'        ? ':!clang++ -O3 % -o %:r<cr>:!time ./%:r<cr>' : \ &ft=='agda'       ? ':!agda -i src %<cr>' :
    \ &ft=='ls'         ? ':!lsc -c %<cr>:!node %:r.js<cr>' :
    \ &ft=='lispell'    ? ':!node ~/Viclib/lispedia/bin/lis.js reduce %:r<cr>' :
    \ ':!time cc %<cr>')

:nnoremap <expr> <leader>m ':w!<cr>:!clear; cargo install --path .<cr>'
":nnoremap <expr> <leader>w ':w!<cr>:!clear; npm run build<cr>:!osascript ~/dev/me/refresh_chrome.applescript &<cr>'
:nnoremap <expr> <leader>w ':w!<cr>:!clear; node /Users/v/vic/dev/Kind/web/build.js<cr>:!osascript ~/vic/dev/refresh_chrome.applescript &<cr>'
:nnoremap <expr> <leader>x ':x!<cr>'
:nnoremap <expr> <leader>q ':q!<cr>'
:nnoremap <leader>b :put!='----------'<cr>:put!=strftime('%Y-%m-%d')<cr>
":map <leader>q :xa!<cr>

" GPT-3 binding from https://github.com/tom-doerr/vim_codex
:nmap <leader>g :<C-U>exe "CreateCompletion ".v:count1<CR>

 "NERDTree stuff
:let NERDTreeIgnore = ['\.idr\~$','\.git', '\.cache','\.ibc$','\.min.js$','\.agdai','\.pyc$','\.hi$','\.o$','\.js_o$','\.js_hi$','\.dyn_o$','\.dyn_hi$','\.jsexe','.*dist\/.*','.*bin\/.*']
:let NERDTreeChDirMode = 2
:let NERDTreeWinSize = 24
:let NERDTreeShowHidden=1
:nmap <expr> <enter> v:count1 <= 1 ? "<C-h>C<C-w>p" : "@_<C-W>99h". v:count1 ."Go<C-w>l"

:nmap <leader>n :NERDTree<CR>
au VimEnter * NERDTree
 au VimEnter * set nu "enable to always set nu
au VimEnter * wincmd l

:nmap <expr> <leader>t ":ClearCtrlPCache<cr>:NERDTree<cr>:set nu<cr><C-w>l"

" Can I solve the ESC out of home problem?
:inoremap ☮ <esc>
:vnoremap ☮ <esc>
:cnoremap ☮ <esc>

:set clipboard=unnamed,unnamedplus,autoselect

" PBufferWindows
:map <left> 1<C-w><
:map <right> 1<C-w>>
:map <up> 1<C-w>-
:map <down> 1<C-w>+
:noremap <C-j> <esc><C-w>j
":noremap <C-k> <esc><C-w>k
:noremap <C-h> <esc><C-w>h
:noremap <C-l> <esc><C-w>l
:map! <C-j> <esc><C-w>j
":map! <C-k> <esc><C-w>k
:map! <C-h> <esc><C-w>h
:map! <C-l> <esc><C-w>l
nnoremap <C-a> :NERDTreeToggle<CR>

" Change Color when entering Insert Mode
"hi cursorline cterm=none ctermbg=black
au InsertEnter * set cursorline
au InsertLeave * set nocursorline

" vim-ls
" call pathogen#runtime_append_all_bundles()
hi link lsSpaceError NONE
hi link lsReservedError NONE

" Vim can automatically change the current working directory to the directory where the file you are editing lives. 
" set autochdir*/

" space to enter command
" :nnoremap <space> :
:syntax on

" cursor always in middle of screen
:set scrolloff=999 " vertically keep cursor on the middle of the screen
:set sidescrolloff=0 " only scroll horizontally when out of bounds

:map , <leader>

" join
:nnoremap <leader>j J

" default the statusline to green when entering Vim
hi StatusLine ctermfg=lightblue ctermbg=black
hi StatusLineNC ctermfg=gray ctermbg=black
hi VertSplit ctermfg=gray ctermbg=black

" NERDComment
:map ! <leader>c<space>

" d/ to unhighlight search matches
:nnoremap d/ :nohl<cr>

" R to search&replace
" :nnoremap R :%s/*/

" macros
:nnoremap q qa<esc>
:nnoremap Q @a

" previous and next location
:nnoremap <C-u> <C-o>
":nnoremap <C-i> <C-i>
":nnoremap <TAB> <C-i>

" quit

" navigates through marks (if exist), if not, moves fast
:nnoremap <S-j> 6gj
:nnoremap <S-k> 6gk
:vnoremap <S-j> 6gj
:vnoremap <S-k> 6gk

" line join (because <S-j> is taken)
:nnoremap <leader>j J

" go to previous location
:nmap <D-h>    <C-o>

" :inoremap <S-space> <tab>
:nmap ( <<
:nmap ) >>
":nmap <tab> >>
":nmap <S-tab> << 
:map U <C-r>
:nmap <C-j> <C-w>j
":nmap <C-k> <C-w>k
:nmap <C-l> <C-w>l
:nmap <C-h> <C-w>h

" begin/end of line
:nnoremap H ^
:nnoremap L $
:vnoremap H ^
:vnoremap L $

" idris ft
"au BufNewFile,BufRead *.ls set filetype=LLivescript
au BufNewFile,BufRead *.purs set filetype=purescript
au BufNewFile,BufRead *.chaos set filetype=chaos
au BufNewFile,BufRead *.chaos set syntax=javascript
au BufNewFile,BufRead *.moon set filetype=moon
au BufNewFile,BufRead *.escoc set filetype=escoc
au BufNewFile,BufRead *.escoc set syntax=javascript
au BufNewFile,BufRead *.sic set filetype=sic
au BufNewFile,BufRead *.moon set syntax=javascript
au BufNewFile,BufRead *.mt set filetype=morte
"au BufNewFile,BufRead *.idr set filetype=idris
au BufNewFile,BufRead *.lean set filetype=lean
au BufNewFile,BufRead *.coc set filetype=coc
au BufNewFile,BufRead *.ult set filetype=ultimate
au BufNewFile,BufRead *.lc set filetype=lambda
au BufNewFile,BufRead *.lc set syntax=elm
au BufNewFile,BufRead *.lam set filetype=lambda
au BufNewFile,BufRead *.lam set syntax=elm
au BufNewFile,BufRead *.mel set filetype=caramel
au BufNewFile,BufRead *.mel set syntax=elm
au BufNewFile,BufRead *.dvl set filetype=dvl
au BufNewFile,BufRead *.lis set filetype=lispell
au BufNewFile,BufRead *.lscm set filetype=lispell
au BufNewFile,BufRead *.sol set filetype=solidity
au BufNewFile,BufRead *.eatt set filetype=eatt
au BufNewFile,BufRead *.eatt set syntax=javascript
au BufNewFile,BufRead *.fm set filetype=formality
au BufNewFile,BufRead *.fm set syntax=javascript
au BufNewFile,BufRead *.fmfm set filetype=fmfm
au BufNewFile,BufRead *.fmfm set syntax=javascript
au BufNewFile,BufRead *.ifm set filetype=informality
au BufNewFile,BufRead *.ifm set syntax=javascript
au BufNewFile,BufRead *.eac set filetype=eac
au BufNewFile,BufRead *.eac set syntax=javascript
au BufNewFile,BufRead *.fmc set filetype=formcore
au BufNewFile,BufRead *.fmc set syntax=javascript
au BufNewFile,BufRead *.html set syntax=html
au BufNewFile,BufRead *.kind2 set filetype=kind2
au BufNewFile,BufRead *.kind2 set syntax=kind
au BufNewFile,BufRead *.type set filetype=type
au BufNewFile,BufRead *.type set syntax=javascript
au BufNewFile,BufRead *.js set syntax=javascript
au BufNewFile,BufRead *.js set filetype=javascript
au BufNewFile,BufRead *.jsx set syntax=javascript
au BufNewFile,BufRead *.kind set filetype=kind
au BufNewFile,BufRead *.kind set syntax=kind
au BufNewFile,BufRead *.kindelia set filetype=kindelia
au BufNewFile,BufRead *.kindelia set syntax=javascript
au BufNewFile,BufRead *.kdl set filetype=kindelia
au BufNewFile,BufRead *.kdl set syntax=javascript
au BufNewFile,BufRead *.bolt set filetype=lambolt
au BufNewFile,BufRead *.bolt set syntax=javascript
au BufNewFile,BufRead *.hvm set filetype=hvm
au BufNewFile,BufRead *.hvm set syntax=javascript
au BufNewFile,BufRead *.hvm syntax region Password start=/^\/\/\~/ end=/$/ " HVM hidden comments
au BufNewFile,BufRead *.hvm highlight Password ctermfg=red guifg=red ctermbg=red guifg=red
au BufNewFile,BufRead *.pwd set syntax=javascript
au BufNewFile,BufRead *.pvt set syntax=javascript

" EVERYTHING MANAGER
au BufNewFile,BufRead *.pvt set filetype=javascript
au BufNewFile,BufRead *.pvt set syntax=javascript
au BufNewFile,BufRead *.pvt syntax region Password start=/^/ end=/$/
au BufNewFile,BufRead *.pvt highlight Password ctermfg=red guifg=red ctermbg=red guifg=red
au BufNewFile,BufRead *.pvt set colorcolumn=0
au BufNewFile,BufRead *.pvt set noundofile
au BufNewFile,BufRead *.pvt :nmap <leader>g :<C-U>echo "NOT ALLOWED, THIS IS A PVT FILE! ".v:count1<CR>
filetype plugin on

" PASSWORD MANAGER
au BufNewFile,BufRead *.pwd set filetype=javascript
au BufNewFile,BufRead *.pwd set syntax=javascript
au BufNewFile,BufRead *.pwd syntax region Password start=/"{/ end=/}"/
au BufNewFile,BufRead *.pwd highlight Password ctermfg=red guifg=red ctermbg=red guifg=red
au BufNewFile,BufRead *.pwd set colorcolumn=0
au BufNewFile,BufRead *.pwd set noundofile
au BufNewFile,BufRead *.pwd :nmap <leader>g :<C-U>echo "NOT ALLOWED, THIS IS A PWD FILE! ".v:count1<CR>
filetype plugin on


"=============== Agda ===============
au BufNewFile,BufRead *.agda setf agda 
" let g:agda_extraincpaths = ["/home/derek/haskell/agda-stdlib-0.8.1/src"]
let g:agdavim_enable_goto_definition = 0
" C-c C-l -> \l
nnoremap <buffer> <LocalLeader>l :AgdaReload<CR>


command! -buffer -nargs=0 AgdaLoad call AgdaLoad(v:false)
command! -buffer -nargs=0 AgdaVersion call AgdaVersion(v:false)
command! -buffer -nargs=0 AgdaReload silent! make!|redraw!
command! -buffer -nargs=0 AgdaRestartAgda exec s:python_cmd 'AgdaRestart()'
command! -buffer -nargs=0 AgdaShowImplicitArguments exec s:python_cmd "sendCommand('ShowImplicitArgs True')"
command! -buffer -nargs=0 AgdaHideImplicitArguments exec s:python_cmd "sendCommand('ShowImplicitArgs False')"
command! -buffer -nargs=0 AgdaToggleImplicitArguments exec s:python_cmd "sendCommand('ToggleImplicitArgs')"
command! -buffer -nargs=0 AgdaConstraints exec s:python_cmd "sendCommand('Cmd_constraints')"
command! -buffer -nargs=0 AgdaMetas exec s:python_cmd "sendCommand('Cmd_metas')"
command! -buffer -nargs=0 AgdaSolveAll exec s:python_cmd "sendCommand('Cmd_solveAll')"
command! -buffer -nargs=1 AgdaShowModule call AgdaShowModule(<args>)
command! -buffer -nargs=1 AgdaWhyInScope call AgdaWhyInScope(<args>)
command! -buffer -nargs=1 AgdaSetRewriteMode exec s:python_cmd "setRewriteMode('<args>')"
command! -buffer -nargs=0 AgdaSetRewriteModeAsIs exec s:python_cmd "setRewriteMode('AsIs')"
command! -buffer -nargs=0 AgdaSetRewriteModeNormalised exec s:python_cmd "setRewriteMode('Normalised')"
command! -buffer -nargs=0 AgdaSetRewriteModeSimplified exec s:python_cmd "setRewriteMode('Simplified')"
command! -buffer -nargs=0 AgdaSetRewriteModeHeadNormal exec s:python_cmd "setRewriteMode('HeadNormal')"
command! -buffer -nargs=0 AgdaSetRewriteModeInstantiated exec s:python_cmd "setRewriteMode('Instantiated')"

" C-c C-l -> \l
nnoremap <buffer> <LocalLeader>l :AgdaReload<CR>

" C-c C-d -> \t
nnoremap <buffer> <LocalLeader>t :call AgdaInfer()<CR>

" C-c C-r -> \r
nnoremap <buffer> <LocalLeader>r :call AgdaRefine("False")<CR>
nnoremap <buffer> <LocalLeader>R :call AgdaRefine("True")<CR>

" C-c C-space -> \g
nnoremap <buffer> <LocalLeader>g :call AgdaGive()<CR>

" C-c C-g -> \c
nnoremap <buffer> <LocalLeader>c :call AgdaMakeCase()<CR>

" C-c C-a -> \a
nnoremap <buffer> <LocalLeader>a :call AgdaAuto()<CR>

" C-c C-, -> \e
nnoremap <buffer> <LocalLeader>e :call AgdaContext()<CR>

" C-u C-c C-n -> \n
nnoremap <buffer> <LocalLeader>n :call AgdaNormalize("IgnoreAbstract")<CR>

" C-c C-n -> \N
nnoremap <buffer> <LocalLeader>N :call AgdaNormalize("DefaultCompute")<CR>
nnoremap <buffer> <LocalLeader>M :call AgdaShowModule('')<CR>

" C-c C-w -> \y
nnoremap <buffer> <LocalLeader>y :call AgdaWhyInScope('')<CR>
nnoremap <buffer> <LocalLeader>h :call AgdaHelperFunction()<CR>

" M-. -> \d
nnoremap <buffer> <LocalLeader>d :call AgdaGotoAnnotation()<CR>

" C-c C-? -> \m
nnoremap <buffer> <LocalLeader>m :AgdaMetas<CR>

" Show/reload metas
" C-c C-? -> C-e
nnoremap <buffer> <C-e> :AgdaMetas<CR>
inoremap <buffer> <C-e> <C-o>:AgdaMetas<CR>

" Go to next/previous meta
" C-c C-f -> C-g
nnoremap <buffer> <silent> <C-g>  :let _s=@/<CR>/ {!\\| ?<CR>:let @/=_s<CR>2l
inoremap <buffer> <silent> <C-g>  <C-o>:let _s=@/<CR><C-o>/ {!\\| ?<CR><C-o>:let @/=_s<CR><C-o>2l

" C-c C-b -> C-y
nnoremap <buffer> <silent> <C-y>  2h:let _s=@/<CR>? {!\\| \?<CR>:let @/=_s<CR>2l
inoremap <buffer> <silent> <C-y>  <C-o>2h<C-o>:let _s=@/<CR><C-o>? {!\\| \?<CR><C-o>:let @/=_s<CR><C-o>2l



" Scheme
au BufNewFile,BufRead *.scm set nolisp
au BufRead,BufNewFile *.kind set filetype=kind
au BufRead,BufNewFile *.kind2 set filetype=kind2
au BufNewFile,BufRead *.html set syntax=html
autocmd BufWinEnter *.agda noremap <silent> <buffer> <leader>l :call agda#load()<cr>


"filetype on
"filetype plugin indent on

" C++11 syntax
"au BufNewFile,BufRead *.cpp set syntax=cpp11

" More fold stuff
:nnoremap + zr:echo 'foldlevel: ' . &foldlevel<cr>
:nnoremap - zm:echo 'foldlevel: ' . &foldlevel<cr>
:nnoremap <leader>f zO
:nnoremap <leader>d zo
:nnoremap <leader>s zc
:nnoremap <leader>a zC


" let g:rainbow_active = 1

" relative lines on/off
"nnoremap <silent><leader>n :set relativenumber!<cr>

:set comments+=:--

set undofile
set undodir=~/.vim/undo
set foldlevel=0
au Syntax * normal zR

set formatoptions=cql
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" ===== CLONE NERDTREE ====
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" ===== KIND SYNTAX ======
au BufRead,BufNewFile *.kind set filetype=kind

au BufRead,BufNewFile *.kind2 set filetype=kind2
au BufRead,BufNewFile *.kind2 set syntax=rust
au BufNewFile,BufRead *.hvm set syntax=javascript

" highlight default link

let g:rust_clip_command = 'xclip -selection clipboard'


"  ===== COLORSCHEME =====
" colorscheme gruvbox
" set term=xterm-256color
"set term=screen-256color
if has('termguicolors')
    set termguicolors
endif

set background=dark
let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material
" let g:lightline.colorscheme = 'gruvbox_material'
" let g:airline_theme = 'gruvbox_material'
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_terminal_colors = 1
let g:gruvbox_material_better_performance = 1

" colorscheme synthwave84
" set termguicolors
" set background=dark
" let g:gruvbox_italic = 1
" let g:gruvbox_underline = 1
" let g:gruvbox_improved_strings = 1
" let g:gruvbox_italicize_strings = 1
" ------- theme GRUVBOX CONFIG ---------


" Change highlighting of cursor line when entering/leaving Insert Mode
set cursorline
                      " highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
" autocmd InsertEnter * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=234 guifg=NONE guibg=#242426
" autocmd InsertLeave * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212

syntax enable
filetype plugin indent on


" ========== NERDCOMMENTS  ==========
"
" Create default mappings
let g:NERDCreateDefaultMappings = 1
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
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left':'//' }}
let g:NERDCustomDelimiters = { 'hvm': { 'left':'//' }}
let g:NERDCustomDelimiters = { 'HVM': { 'left':'//' }}
let g:NERDCustomDelimiters = { 'default': { 'left':'//' }}
let g:NERDCustomDelimiters = { 'kind': { 'left':'//' }}
let g:NERDCustomDelimiters = { 'kind2': { 'left':'//' }}

"========= Finish NerdComments =========

" indent line
let g:indentLine_setColors = 1
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_char = "¦"

"color
" set termguicolors
" let g:Hexokinase_highlighters = ['backgroundfull']
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='deus'
" ================== mudei aqui =====================
let g:airline_theme = 'gruvbox_material'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
" ===================================================



" Vim DevIcons  ==========================
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


" let g:WebDevIconsOS = 'Darwin'
" call current line as a terminal command, paste below
map <leader>, 0y$:r!<C-r>"<CR>

" CtrlP auto cache clearing.
" ----------------------------------------------------------------------------
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

:noremap m %

set runtimepath^=~/.vim/bundle/ag

function! SetTerminalTitle()
    let titleString = expand('%:t')
    if len(titleString) > 0
        let &titlestring = expand('%:t')
        " this is the format iTerm2 expects when setting the window title
        let args = "\033];".&titlestring."\007"
        let cmd = 'silent !echo -e "'.args.'"'
        execute cmd
        redraw!
    endif
endfunction
autocmd BufEnter * call SetTerminalTitle()



" https://vi.stackexchange.com/questions/2232/how-can-i-use-vim-as-a-hex-editor
" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.wasm let &bin=1
  au BufReadPost *.wasm if &bin | %!xxd
  au BufReadPost *.wasm set ft=xxd | endif
  au BufWritePre *.wasm if &bin | %!xxd -r
  au BufWritePre *.wasm endif
  au BufWritePost *.wasm if &bin | %!xxd
  au BufWritePost *.wasm set nomod | endif
augroup END

" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END

" always split windows vertically
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

let g:netrw_altv=1
" finish split config ==========================

" Vim syntax dor javascript
let g:javascript_plugin_jsdoc = 1


" Markdown preview
let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=2
let vim_markdown_preview_browser='Firefox'

set clipboard=unnamed
" set clipboard=unnamedplus
" set guifont=Hack\ 14
" set guifont=Noto\ 11
" set guifont=DroidSansMono_Nerd_Font:h11
" set guifont=Source\ Code\ Pro\ 13
" highlight Comment cterm=italic
autocmd VimEnter * NERDTree | wincmd p
