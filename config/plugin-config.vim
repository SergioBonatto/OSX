" =============================================================================
" Plugin Configurations
" =============================================================================

" === NERDTree ===
let NERDTreeIgnore = [
    \ 'node_modules', '^\.', '\.git', '\.cache',
    \ '\.pyc$', '\.o$', '\.swp$', 'dist', 'build'
    \ ]
let NERDTreeChDirMode = 0
let NERDTreeWinSize = 24
let NERDTreeShowHidden = 1
let NERDTreeRespectWildIgnore = 1
let NERDTreeHijackNetrw = 0

" Auto-open NERDTree safely
function! s:SafeNERDTreeOpen()
  if isdirectory(getcwd())
    try
      NERDTree
      wincmd l
    catch /^NERDTree/
      execute 'NERDTree ' . expand('~')
      wincmd l
    endtry
  endif
endfunction

" Auto-close if only NERDTree left
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" === ALE (Linting) ===
let g:ale_set_highlights = 0
let g:ale_sign_column_always = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 1

" === IndentLine ===
let g:indentLine_setColors = 1
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_char = "¦"

" === DevIcons ===
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_ctrlp = 1
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = 'λ'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" === CtrlP ===
let g:ctrlp_by_filename = 0

" === NERDCommenter ===
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = {
\ 'phi'     : { 'left': '--', 'leftAlt': '{-', 'rightAlt': '-}' },
\ 'agda'    : { 'left': '--', 'leftAlt': '{-', 'rightAlt': '-}' },
\ 'haskell' : { 'left': '--', 'leftAlt': '{-', 'rightAlt': '-}' },
\ 'kind'    : { 'left': '//' }
\ }

" Set default comment delimiter for unknown file types
let g:NERDCommentWholeLinesInVMode = 1

" Default comment string for files without specific type
set commentstring=//\ %s

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" Enable multi-line comment support
let g:NERDBlockComIgnoreEmpty = 0

" Create default mappings for multiline comments
let g:NERDCreateDefaultMappings = 1

" === Auto-commands ===
augroup PluginAutoCommands
  autocmd!
  autocmd VimEnter * call s:SafeNERDTreeOpen()
  autocmd VimEnter * set number
  autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

  " Set default comment string for files without specific type
  autocmd BufEnter * if &commentstring == '' | setlocal commentstring=//\ %s | endif
  autocmd BufEnter * if &filetype == '' | setlocal commentstring=//\ %s | endif

  " Additional phi file configuration for syntax
  autocmd BufNewFile,BufRead *.phi setlocal filetype=phi
augroup END


" Vimsence
let g:vimsence_client_id = '715372754408439852'
let g:vimsence_editing_details = 'Editing: {}'
let g:vimsence_editing_state = 'Working on: {}'
let g:vimsence_file_explorer_text = 'In NERDTree'
let g:vimsence_file_explorer_details = 'Looking for files'
let g:vimsence_custom_icons = {'filetype': 'iconname'}
