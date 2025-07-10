" =============================================================================
" Plugin Manager - vim-plug
" =============================================================================

call plug#begin('~/.vim/plugged')

" === Core Functionality ===
Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'

" === Themes (choose one main theme) ===
" Plug 'rakr/vim-one'
" Optional alternatives (comment out what you don't use)
" Plug 'morhetz/gruvbox'
" Plug 'rose-pine/vim'

" === Code Quality ===
Plug 'dense-analysis/ale'
" Note: Removed syntastic - conflicts with ALE

" === Editing ===
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'

" === Git ===
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" === Language Support ===
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'mattn/emmet-vim'

" === Your Custom Plugins ===
Plug 'SergioBonatto/VimFileType'
Plug 'SergioBonatto/Agda-vim'
Plug 'SergioBonatto/bend-vim'
Plug 'SergioBonatto/vim-run-code'
Plug 'SergioBonatto/todo-vim'
Plug 'SergioBonatto/vim-kind'

" === Utilities ===
Plug 'sakshamgupta05/vim-todo-highlight'
Plug 'wakatime/vim-wakatime'

call plug#end()
