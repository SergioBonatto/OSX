" =============================================================================
" Plugin Manager - vim-plug
" =============================================================================

call plug#begin('~/.vim/plugged')

" === Core Functionality ===
Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'

" === Code Quality ===
Plug 'dense-analysis/ale'
" Note: Removed syntastic - conflicts with ALE

" === Editing ===
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'
Plug 'SergioBonatto/gemini-vim'

" === Git ===
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" === Language Support ===
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'mattn/emmet-vim'
Plug 'bfrg/vim-c-cpp-modern'
Plug 'jaxbot/semantic-highlight.vim'



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