" ===================================================================
" ATOM ONE LIGHT STATUSLINE MODULE
" Semantic mapping based on the original Atom One Light palette
" ===================================================================

" Guard to avoid conflicts
if exists('g:loaded_statusline_atom_one_light')
  finish
endif
let g:loaded_statusline_atom_one_light = 1

" Statusline initialization function
function! statusline#init()
  " Official Atom One Light colors - EXACT
  let s:bg        = "#fafafa"  " Main background
  let s:fg        = "#383a42"  " Default text (Normal, Operator)
  let s:comment   = "#a0a1a7"  " Comments
  let s:keyword   = "#a626a4"  " Keywords (Statement, Conditional...)
  let s:string    = "#50a14f"  " Strings
  let s:number    = "#986801"  " Numbers, Boolean, Constant
  let s:function  = "#4078f2"  " Functions
  let s:variable  = "#e45649"  " Identifier, Special, Delete (git)
  let s:orange    = "#c18401"  " Alternative yellow/orange tone
  let s:guide     = "#e5e5e6"  " Visual guides (separators)
  let s:cursor_bg = "#f0f0f0"  " CursorLine background

  " Mode color mapping:
  " Normal    -> Function (blue)     - main mode, calm color
  " Insert    -> String (green)      - insert, growth color
  " Replace   -> Variable (red)      - replace, attention color
  " Visual    -> Keyword (purple)    - selection, highlight color
  " Command   -> Number (orange)     - command, action color
  " Terminal  -> Orange (yellow)     - terminal, alternative color

  " Base StatusLine - using correct colors
  execute 'highlight StatusLine      guifg=' . s:fg . ' guibg=' . s:guide . ' gui=NONE'
  execute 'highlight StatusLineNC    guifg=' . s:comment . ' guibg=' . s:guide . ' gui=NONE'

  " Mode colors - using the official palette with better contrast
  execute 'highlight ModeNFGC        guifg=' . s:bg . ' guibg=' . s:function . ' gui=bold'
  execute 'highlight ModeNFGCS       guifg=' . s:function . ' guibg=' . s:guide . ' gui=NONE'
  execute 'highlight ModeIFGC        guifg=' . s:bg . ' guibg=' . s:string . ' gui=bold'
  execute 'highlight ModeIFGCS       guifg=' . s:string . ' guibg=' . s:guide . ' gui=NONE'
  execute 'highlight ModeRFGC        guifg=' . s:bg . ' guibg=' . s:variable . ' gui=bold'
  execute 'highlight ModeRFGCS       guifg=' . s:variable . ' guibg=' . s:guide . ' gui=NONE'
  execute 'highlight ModeVFGC        guifg=' . s:bg . ' guibg=' . s:keyword . ' gui=bold'
  execute 'highlight ModeVFGCS       guifg=' . s:keyword . ' guibg=' . s:guide . ' gui=NONE'
  execute 'highlight ModeCFGC        guifg=' . s:bg . ' guibg=' . s:number . ' gui=bold'
  execute 'highlight ModeCFGCS       guifg=' . s:number . ' guibg=' . s:guide . ' gui=NONE'
  execute 'highlight ModeTFGC        guifg=' . s:bg . ' guibg=' . s:orange . ' gui=bold'
  execute 'highlight ModeTFGCS       guifg=' . s:orange . ' guibg=' . s:guide . ' gui=NONE'

  " Buffer and status colors - official colors with correct semantics
  execute 'highlight BufferS         guifg=' . s:comment . ' guibg=' . s:guide . ' gui=NONE'
  execute 'highlight Modified        guifg=' . s:fg . ' guibg=#ffe792 gui=bold'
  execute 'highlight ModifiedS       guifg=#ffe792 guibg=' . s:guide . ' gui=NONE'
  execute 'highlight SLGreen         guifg=' . s:fg . ' guibg=#e6ffed gui=NONE'
  execute 'highlight SLBlue          guifg=' . s:fg . ' guibg=' . s:cursor_bg . ' gui=NONE'
  execute 'highlight BufferError     guifg=' . s:bg . ' guibg=' . s:variable . ' gui=bold'
  execute 'highlight BufferErrorS    guifg=' . s:variable . ' guibg=' . s:guide . ' gui=NONE'
  execute 'highlight SLLimiter       guifg=' . s:string . ' guibg=' . s:guide . ' gui=NONE'
  execute 'highlight CursorStatus    guifg=' . s:fg . ' guibg=#e6ffed gui=NONE'
endfunction

" ===================================================================
" STATUSLINE FUNCTIONS
" ===================================================================

" Powerline symbols
function! s:GetSymbols()
  if empty($DISPLAY) || !has('gui_running')
    return ['', '']
  else
    return ['', '']
  endif
endfunction

" Set colors for statusline based on mode
function! statusline#DetectMode(mode)
  let [l:leftSymbol, l:rightSymbol] = s:GetSymbols()
  let l:statusline = ""

  " Mode section with appropriate colors
  if a:mode == 'n'
    let l:statusline .= "%#ModeNFGCS#" . l:leftSymbol
    let l:statusline .= "%#ModeNFGC# NORMAL "
    let l:statusline .= "%#ModeNFGCS#" . l:rightSymbol . l:leftSymbol
    let l:statusline .= "%#StatusLine#[%n/%{bufnr('$')}] "
  elseif a:mode == 'i'
    let l:statusline .= "%#ModeIFGCS#" . l:leftSymbol
    let l:statusline .= "%#ModeIFGC# INSERT "
    let l:statusline .= "%#ModeIFGCS#" . l:rightSymbol . l:leftSymbol
    let l:statusline .= "%#StatusLine#[%n/%{bufnr('$')}] "
  elseif a:mode == 'R'
    let l:statusline .= "%#ModeRFGCS#" . l:leftSymbol
    let l:statusline .= "%#ModeRFGC# REPLACE "
    let l:statusline .= "%#ModeRFGCS#" . l:rightSymbol . l:leftSymbol
    let l:statusline .= "%#StatusLine#[%n/%{bufnr('$')}] "
  elseif a:mode ==# 'v'
    let l:statusline .= "%#ModeVFGCS#" . l:leftSymbol
    let l:statusline .= "%#ModeVFGC# VISUAL "
    let l:statusline .= "%#ModeVFGCS#" . l:rightSymbol . l:leftSymbol
    let l:statusline .= "%#StatusLine#[%n/%{bufnr('$')}] "
  elseif a:mode ==# 'V'
    let l:statusline .= "%#ModeVFGCS#" . l:leftSymbol
    let l:statusline .= "%#ModeVFGC# V-LINE "
    let l:statusline .= "%#ModeVFGCS#" . l:rightSymbol . l:leftSymbol
    let l:statusline .= "%#StatusLine#[%n/%{bufnr('$')}] "
  elseif a:mode ==# ''
    let l:statusline .= "%#ModeVFGCS#" . l:leftSymbol
    let l:statusline .= "%#ModeVFGC# V-BLOCK "
    let l:statusline .= "%#ModeVFGCS#" . l:rightSymbol . l:leftSymbol
    let l:statusline .= "%#StatusLine#[%n/%{bufnr('$')}] "
  elseif a:mode ==# 'c'
    let l:statusline .= "%#ModeCFGCS#" . l:leftSymbol
    let l:statusline .= "%#ModeCFGC# COMMAND "
    let l:statusline .= "%#ModeCFGCS#" . l:rightSymbol . l:leftSymbol
    let l:statusline .= "%#StatusLine#[%n/%{bufnr('$')}] "
  elseif a:mode ==# 't'
    let l:statusline .= "%#ModeTFGCS#" . l:leftSymbol
    let l:statusline .= "%#ModeTFGC# TERMINAL "
    let l:statusline .= "%#ModeTFGCS#" . l:rightSymbol . l:leftSymbol
    let l:statusline .= "%#StatusLine#[%n/%{bufnr('$')}] "
  else
    let l:statusline .= "%#ModeNFGCS#" . l:leftSymbol
    let l:statusline .= "%#ModeNFGC# NORMAL "
    let l:statusline .= "%#ModeNFGCS#" . l:rightSymbol . l:leftSymbol
    let l:statusline .= "%#StatusLine#[%n/%{bufnr('$')}] "
  endif

  " File name section with modification indicator
  if &modified == 1
    let l:statusline .= "%#Modified# %.20f %#ModifiedS#" . l:rightSymbol . " "
  else
    let l:statusline .= "%#StatusLine# %.20f %#BufferS#" . l:rightSymbol . " "
  endif

  " Right alignment
  let l:statusline .= "%="

  " Git information (if available)
  if exists('*FugitiveHead') && len(FugitiveHead()) > 0
    let l:statusline .= "%#BufferS#" . l:leftSymbol . "%#SLGreen# " . FugitiveHead() . " "
    if exists('*GitGutterGetHunkSummary')
      let l:statusline .= "%#SLBlue# %{statusline#GitGutterStatus()} %#BufferS#" . l:rightSymbol . " "
    else
      let l:statusline .= "%#BufferS#" . l:rightSymbol . " "
    endif
  elseif exists('*GitGutterGetHunkSummary')
    let l:statusline .= "%#BufferS#" . l:leftSymbol . "%#SLBlue# %{statusline#GitGutterStatus()} %#BufferS#" . l:rightSymbol . " "
  endif

  " File type
  let l:statusline .= "%#BufferS#" . l:leftSymbol . "%#StatusLine# %{statusline#GetFileType()} "

  " Error/Lint status with better handling
  if exists('*coc#status') && !empty(get(b:, 'coc_diagnostic_info', {}))
    let l:coc_status = coc#status()
    if l:coc_status != ""
      let l:statusline .= "%#BufferError# " . l:coc_status . "%{get(b:,'coc_current_function','')} %#BufferErrorS#" . l:rightSymbol . " "
    else
      let l:statusline .= "%#BufferS#" . l:rightSymbol . " "
    endif
  elseif exists('*ale#statusline#Count')
    let l:ale_status = statusline#GetAleStatus()
    if l:ale_status == "OK"
      let l:statusline .= "%#SLLimiter#✓%#CursorStatus# " . l:ale_status . " %#BufferS#" . l:rightSymbol . " "
    else
      let l:statusline .= "%#BufferError# " . l:ale_status . " %#BufferErrorS#" . l:rightSymbol . " "
    endif
  else
    let l:statusline .= "%#BufferS#" . l:rightSymbol . " "
  endif

  " Cursor position
  let l:statusline .= "%#BufferS#" . l:leftSymbol . "%#StatusLine# %-8.(%l,%c%) "

  " Final percentage section with mode color
  if a:mode == 'n'
    let l:statusline .= "%#ModeNFGC# %P %#ModeNFGCS#" . l:rightSymbol
  elseif a:mode == 'i'
    let l:statusline .= "%#ModeIFGC# %P %#ModeIFGCS#" . l:rightSymbol
  elseif a:mode == 'R'
    let l:statusline .= "%#ModeRFGC# %P %#ModeRFGCS#" . l:rightSymbol
  elseif a:mode ==# 'v' || a:mode ==# 'V' || a:mode ==# ''
    let l:statusline .= "%#ModeVFGC# %P %#ModeVFGCS#" . l:rightSymbol
  elseif a:mode ==# 'c'
    let l:statusline .= "%#ModeCFGC# %P %#ModeCFGCS#" . l:rightSymbol
  elseif a:mode ==# 't'
    let l:statusline .= "%#ModeTFGC# %P %#ModeTFGCS#" . l:rightSymbol
  else
    let l:statusline .= "%#ModeNFGC# %P %#ModeNFGCS#" . l:rightSymbol
  endif

  return l:statusline
endfunction

" ===================================================================
" HELPER FUNCTIONS
" ===================================================================

" Debug function to check loading
function! statusline#debug()
  echom "=== DEBUG STATUSLINE ==="
  echom "statusline#init exists: " . exists('*statusline#init')
  echom "statusline#DetectMode exists: " . exists('*statusline#DetectMode')
  echom "statusline#GetFileType exists: " . exists('*statusline#GetFileType')
  echom "statusline#GetAleStatus exists: " . exists('*statusline#GetAleStatus')
  echom "statusline#GitGutterStatus exists: " . exists('*statusline#GitGutterStatus')
  echom "Current statusline: " . &statusline
  echom "======================="
endfunction

" Helper function for filetype
function! statusline#GetFileType(...)
  if a:0 == 0
    let filetype = &filetype
  else
    let filetype = a:1
  endif

  if filetype == '' || filetype == 'nerdtree'
    return '-'
  else
    return tolower(filetype)
  endif
endfunction

" Helper function for ALE status
function! statusline#GetAleStatus() abort
  if !exists('*ale#statusline#Count')
    return 'N/A'
  endif

  try
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    if l:counts.total == 0
      return 'OK'
    else
      return printf('%dW %dE', l:all_non_errors, l:all_errors)
    endif
  catch
    return 'N/A'
  endtry
endfunction

" Helper function for GitGutter status
function! statusline#GitGutterStatus()
  if !exists('*GitGutterGetHunkSummary')
    return ''
  endif

  try
    let [a,m,r] = GitGutterGetHunkSummary()
    if a == 0 && m == 0 && r == 0
      return 'clean'
    endif
    return printf('+%d ~%d -%d', a, m, r)
  catch
    return ''
  endtry
endfunction

" ===================================================================
" MODULE DOCUMENTATION
" ===================================================================
" Statusline module for Atom One Light with OFFICIAL colors
"
" USAGE:
" In your .vimrc, add after loading plugins:
"   autocmd VimEnter * call statusline#init()
"   set laststatus=2
"   set statusline=%!statusline#DetectMode(mode())
"
" AVAILABLE FUNCTIONS:
" • statusline#init() - Initializes statusline colors
" • statusline#DetectMode(mode) - Builds the statusline based on mode
" • statusline#GetFileType(...) - Returns the formatted file type
" • statusline#GetAleStatus() - ALE linter status
" • statusline#GitGutterStatus() - Git status via GitGutter
"
" IMPLEMENTED COLORS (exact palette):
" • #fafafa - Main background
" • #383a42 - Default text (Normal, Operator)
" • #a0a1a7 - Comments and separators
" • #a626a4 - Keywords (Visual mode)
" • #50a14f - Strings (Insert mode)
" • #986801 - Numbers/Constants (Command mode)
" • #4078f2 - Functions (Normal mode)
" • #e45649 - Identifiers/Variables (Replace mode, errors)
" • #c18401 - Alternative orange (Terminal mode)
" • #e5e5e6 - Visual guides
" • #f0f0f0 - CursorLine background
"
" FEATURES:
" • Semantic color mapping by mode
" • Powerline symbol support (when available)
" • Git integration (fugitive + gitgutter)
" • Linter support (ALE + CoC)
" • Modified file indication
" • Robust fallbacks for missing plugins
" • Load guard to avoid conflicts
"
" OPTIONAL DEPENDENCIES:
" • vim-fugitive, vim-gitgutter, ALE/CoC, powerline font

" vim:set ft=vim et sw=2:
