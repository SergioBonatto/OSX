set noshowmode
set noruler

autocmd ColorScheme * highlight link ModeNFGC  StatuslineNC
autocmd ColorScheme * highlight link ModeNFGCS LineNr
autocmd ColorScheme * highlight link ModeIFGC  DiffAdd
autocmd ColorScheme * highlight link ModeIFGCS DiffAdded
autocmd ColorScheme * highlight link ModeRFGC  Search
autocmd ColorScheme * highlight link ModeRFGCS Repeat
autocmd ColorScheme * highlight link ModeVFGC  CursorIM
autocmd ColorScheme * highlight link ModeVFGCS Conditional
autocmd ColorScheme * highlight link ModeCFGC  DiffText
autocmd ColorScheme * highlight link ModeCFGCS DiffChanged
autocmd ColorScheme * highlight link ModeTFGC  TermCursor
autocmd ColorScheme * highlight link ModeTFGCS Normal

" Get current filetype
function! CheckFT(filetype)
  if aP1+r436F=323536\P1+rOA\P1+rOB\P1+rOC\P1+rOD\P1+r[1;2H\P1+r[1;2D\P1+r[1;2C\P1+r[1;2F\P1+rOP\P1$r1 q\[?12;1$y:filetype == ''
    return '-'
  else
    return tolower(a:filetype)
  endif
endfunction

function! AleStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? 'OK' : printf(
  \ '%dW %dE',
  \ all_non_errors,
  \ all_errors
  \)
endfunction

function! GitGutterStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction

" set colors for statusline based on mode
function! DetectMode(mode)
  if empty($DISPLAY)
    let leftSymbol=""
    let rightSymbol=""
  else
    let leftSymbol=""
    let rightSymbol=""
  end

  let statusline=""
  if a:mode == 'n'
    let statusline .= "%#ModeNFGCS#\ " . leftSymbol
    let statusline .= "%#ModeNFGC#\ NORMAL\ "
    let statusline .= "%#ModeNFGCS#" . rightSymbol . "\ " . leftSymbol
    let statusline .= "%#ModeNFGC#%[%n\ ̷%{bufnr('$')}\ "
  elseif a:mode == 'i'
    let statusline .= "%#ModeIFGCS#\ " . leftSymbol
    let statusline .= "%#ModeIFGC#\ INSERT\ "
    let statusline .= "%#ModeIFGCS#" . rightSymbol . "\ " . leftSymbol
    let statusline .= "%#ModeIFGC#%[%n\ ̷%{bufnr('$')}\ "
  elseif a:mode == 'R'
    let statusline .= "%#ModeRFGCS#\ " . leftSymbol
    let statusline .= "%#ModeRFGC#\ REPLACE\ "
    let statusline .= "%#ModeRFGCS#" . rightSymbol . "\ " . leftSymbol
    let statusline .= "%#ModeRFGC#%[%n\ ̷%{bufnr('$')}\ "
  elseif a:mode ==# 'v'
    let statusline .= "%#ModeVFGCS#\ " . leftSymbol
    let statusline .= "%#ModeVFGC#\ VISUAL\ "
    let statusline .= "%#ModeVFGCS#" . rightSymbol . "\ " . leftSymbol
    let statusline .= "%#ModeVFGC#%[%n\ ̷%{bufnr('$')}\ "
  elseif a:mode ==# 'V'
    let statusline .= "%#ModeVFGCS#\ " . leftSymbol
    let statusline .= "%#ModeVFGC#\ VISUAL\ "
    let statusline .= "%#ModeVFGCS#" . rightSymbol . "\ " . leftSymbol
    let statusline .= "%#ModeVFGC#%[%n\ ̷%{bufnr('$')}\ "
  elseif a:mode ==# ''
    let statusline .= "%#ModeVFGCS#\ " . leftSymbol
    let statusline .= "%#ModeVFGC#\ VISUAL\ "
    let statusline .= "%#ModeVFGCS#" . rightSymbol . "\ " . leftSymbol
    let statusline .= "%#ModeVFGC#%[%n\ ̷%{bufnr('$')}\ "
  elseif a:mode ==# 'c'
    let statusline=""
    let statusline .= "%#ModeCFGCS#\ " . leftSymbol
    let statusline .= "%#ModeCFGC#\ COMMAND\ "
    let statusline .= "%#ModeCFGCS#" . rightSymbol . "\ " . leftSymbol
    let statusline .= "%#ModeCFGC#%[%n\ ̷%{bufnr('$')}\ "
  elseif a:mode ==# 't'
    let statusline .= "%#ModeTFGCS#\ " . leftSymbol
    let statusline .= "%#ModeTFGC#\ TERMINAL\ "
    let statusline .= "%#ModeTFGCS#" . rightSymbol . "\ " . leftSymbol
    let statusline .= "%#ModeTFGC#%[%n\ ̷%{bufnr('$')}\ "
  elseif a:mode == 'v' || a:mode == 'V' || a:mode == '^V' || a:mode == 's' || a:mode == 'S' || a:mode == '^S'
    let statusline .= "%#ModeVFGCS#\ " . leftSymbol
    let statusline .= "%#ModeVFGC#\ VISUAL\ "
    let statusline .= "%#ModeVFGCS#" . rightSymbol . "\ " . leftSymbol
    let statusline .= "%#ModeVFGC#%[%n\ ̷%{bufnr('$')}\ "
  endif
  if &mod == 1
	let statusline .= "%#Modified#\ %.20f\ ⁺%#ModifiedS#" . rightSymbol . "\ "
  else
	let statusline .= "%#Statusline#\ %.20f\ %#BufferS#" . rightSymbol . "\ "
  endif
  let statusline .= "%="
  if exists('*fugitive#statusline') || &rtp =~ 'GitGutter'
    if exists('*fugitive#statusline')
      let statusline .= "%#BufferS#" . leftSymbol . "%#SLGreen#\ %{FugitiveHead()}\ "
    else
      let statusline .= "%#BufferS#" . leftSymbol
    endif
    if &rtp =~ 'GitGutter'
      let statusline .= "%#SLBlue#\ %{GitGutterStatus()}\ %#BufferS#" . rightSymbol . "\ "
    else
      let statusline .= "%#BufferS#" . rightSymbol . "\ "
    endif
  endif
  let statusline .= "%#BufferS#" . leftSymbol . "%#Statusline#\ %{CheckFT(&filetype)}\ "
  if !empty(get(b:, 'coc_diagnostic_info', {}))
    if coc#status() != ""
      let statusline .= "%#BufferError#\ \ %{coc#status()}%{get(b:,'coc_current_function','')}\ %#BufferErrorS#" . rightSymbol . "\ "
    else
      let statusline .= "%#BufferS#" . rightSymbol . "\ "
    endif
  elseif &rtp =~ 'ale'
    if AleStatus() == "OK"
      let statusline .= "%#SLLimiter#│%#CursorStatus#\ %{AleStatus()}\ %#BufferS#" . rightSymbol . "\ "
    else
      let statusline .= "\ %#BufferError#\ %{AleStatus()}\ %#BufferErrorS#" . rightSymbol . "\ "
    endif
  else
    let statusline .= "%#BufferS#" . rightSymbol . "\ "
  endif
  let statusline .= "%#BufferS#" . leftSymbol . "%#Statusline#\ %-8.(%l,%c%)"
  if a:mode == 'n'
    let statusline .= "%#ModeNFGC#\ %P\ %#ModeNFGCS#" . rightSymbol . "\ "
  elseif a:mode == 'i'
    let statusline .= "%#ModeIFGC#\ %P\ %#ModeIFGCS#" . rightSymbol . "\ "
  elseif a:mode == 'R'
    let statusline .= "%#ModeRFGC#\ %P\ %#ModeRFGCS#" . rightSymbol . "\ "
  elseif a:mode ==# 'v'
    let statusline .= "%#ModeVFGC#\ %P\ %#ModeVFGCS#" . rightSymbol . "\ "
  elseif a:mode ==# 'V'
    let statusline .= "%#ModeVFGC#\ %P\ %#ModeVFGCS#" . rightSymbol . "\ "
  elseif a:mode ==# '^V'
    let statusline .= "%#ModeVFGC#\ %P\ %#ModeVFGCS#" . rightSymbol . "\ "
  elseif a:mode ==# 'c'
    let statusline .= "%#ModeCFGC#\ %P\ %#ModeCFGCS#" . rightSymbol . "\ "
  elseif a:mode ==# 't'
    let statusline .= "%#ModeTFGC#\ %P\ %#ModeTFGCS#" . rightSymbol . "\ "
  elseif a:mode == 'v' || a:mode == 'V' || a:mode == '^V' || a:mode == 's' || a:mode == 'S' || a:mode == '^S'
    let statusline .= "%#ModeVFGC#\ %P\ %#ModeVFGCS#" . rightSymbol . "\ "
  endif
  return statusline
  return ' '
endfunction

set laststatus=2
set statusline=%!DetectMode(mode())

" vim:set ft=vim et sw=2:
