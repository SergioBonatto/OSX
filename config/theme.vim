" =============================================================================
" Theme Configuration
" =============================================================================

" True color support
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Font configuration
if has('gui_running')
  if has('gui_macvim')
    set guifont=Fira\ Code:h16
  endif
endif

" Terminal font optimizations
if !has('gui_running')
  set t_ZH=
  set t_ZR=
  set conceallevel=0
  set concealcursor=""
endif

" Theme settings
set background=light
let g:one_allow_italics = 1
colorscheme atomonelight

" Custom highlights
highlight Comment cterm=italic
highlight ALEErrorSign guifg=#FF0000 ctermfg=red
highlight ALEWarningSign guifg=#FFA500 ctermfg=yellow
