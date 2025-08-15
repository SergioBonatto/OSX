export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$PATH:/usr/local/bin"
if command -v brew >/dev/null 2>&1; then
  export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"
fi

ZSH_THEME="pawsh"
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  catimg
  copybuffer
  copyfile
  dircycle
  dirhistory
  extract
  git-prompt
  gitfast
  gitignore
  history
  jsontools
  vi-mode
  python
)
source $ZSH/oh-my-zsh.sh

alias "doom"="sh ~/.config/emacs/bin/doom"
alias "cuda"="sh ~/CompileAndRun.sh"

alias "q"="exit"
alias "dc"="cd"
alias "cdd"="cd .."
alias "gti"="git"
alias "claer"="clear"
alias "c"="clear"
alias "cl"="clear"
alias "clea"="clear"
alias "cler"="clear"
alias "clera"="clear"
alias "celar"="clear"
alias "caler"="clear"
alias "im"="vim"
alias "v"="vim"
alias "vom"="vim"
alias "vimm"="vim"

alias "push"="git push"
alias "pull"="git pull"
alias "commit"="git commit -m"
alias "add"="git add"
alias "status"="git status"
alias "log"="git log"
alias "diff"="git diff"
alias "branch"="git branch"
alias "checkout"="git checkout"

alias "start"="npm start"
alias "test"="npm test"
alias "install"="npm install"

alias "dockerup"="podman-compose up"
alias "dockerdown"="podman-compose stop"
alias "dockerlist"="podman machine list"


_fzf_complete_chatsh() {
  _fzf_complete --multi --reverse --prompt="chatsh> " -- "$@" < <(
    curl -s https://openrouter.ai/api/v1/models | jq -r '.data[].id' | sed 's/^/openrouter:/'
  )
}
[ -n "$BASH" ] && complete -F _fzf_complete_chatsh -o default -o bashdefault chatsh


if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
  alias clear='vterm_printf "51;Evterm-clear-scrollback";tput clear'
fi

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/bonatto/.opam/opam-init/init.zsh' ]] || source '/Users/bonatto/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
eval $(opam env)


# bun completions
[ -s "/Users/bonatto/.bun/_bun" ] && source "/Users/bonatto/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
