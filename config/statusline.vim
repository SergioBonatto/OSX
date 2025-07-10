" =============================================================================
" Statusline Configuration
" =============================================================================

" Simple, effective statusline
function! StatuslineMode()
  let l:mode = mode()
  if l:mode ==# 'n'
    return 'NORMAL'
  elseif l:mode ==# 'i'
    return 'INSERT'
  elseif l:mode ==# 'v'
    return 'VISUAL'
  elseif l:mode ==# 'V'
    return 'V-LINE'
  elseif l:mode ==# "\<C-v>"
    return 'V-BLOCK'
  elseif l:mode ==# 'R'
    return 'REPLACE'
  else
    return 'OTHER'
  endif
endfunction

function! StatuslineGit()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch.' ' : ''
  endif
  return ''
endfunction

function! StatuslineALE()
  if exists('*ale#statusline#Count')
    let counts = ale#statusline#Count(bufnr(''))
    let errors = counts.error + counts.style_error
    let warnings = counts.warning + counts.style_warning
    if errors > 0
      return ' E:'.errors.' '
    elseif warnings > 0
      return ' W:'.warnings.' '
    endif
  endif
  return ''
endfunction

" Build statusline
set statusline=
set statusline+=%#DiffAdd#%{StatuslineMode()}%*
set statusline+=%#LineNr#%{StatuslineGit()}%*
set statusline+=\ %f
set statusline+=%m%r%h%w
set statusline+=%#WarningMsg#%{StatuslineALE()}%*
set statusline+=%=
set statusline+=\ %y
set statusline+=\ [%l,%c]
set statusline+=\ %p%%
