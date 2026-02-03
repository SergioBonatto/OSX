# OH-MY-ZSH CONFIGURATION
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="pawsh"

# Plugins
plugins=(
  git
  gitfast
  zsh-syntax-highlighting
  zsh-autosuggestions
  extract
  history
  vi-mode

  gitignore
  git-prompt
  catimg
  copybuffer
  copyfile
  dircycle
  dirhistory
  jsontools
  python
  brew
  docker
  npm
  node
)

source $ZSH/oh-my-zsh.sh

# PATH CONFIGURATION
export PATH="$HOME/.config/emacs/bin:$HOME/.local/bin:$PATH"

# Homebrew
if command -v brew >/dev/null 2>&1; then
  export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"
fi

# ENVIRONMENT VARIABLES
export EDITOR="vim"
export HISTSIZE=5000
export SAVEHIST=5000

# ALIASES ESSENCIAIS 
alias q="exit"
alias dc="cd"
alias cdd="cd .."
alias ..="cd .."
alias c="clear"
alias claer="clear"
alias v="vim"
alias gti="git"

# Correções de typos comuns para clear
alias claer="clear"
alias caler="clear"
alias celar="clear"
alias clea="clear"
alias cler="clear"
alias clera="clear"
alias c="clear"
alias cl="clear"

# Vim typos
alias im="vim"
alias v="vim"
alias vom="vim"
alias vimm="vim"

# Git typos
alias gti="git"

# Git shortcuts (mais completos)
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit -m"
alias gca="git commit -am"
alias gp="git push"
alias gpl="git pull"
alias gl="git log --oneline"
alias gd="git diff"
alias gb="git branch"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gm="git merge"

# Aliases antigos mantidos para compatibilidade
alias push="git push"
alias pull="git pull"
alias commit="git commit -m"
alias add="git add"
alias status="git status"
alias log="git log"
alias diff="git diff"
alias branch="git branch"
alias checkout="git checkout"

# NPM shortcuts
alias ns="npm start"
alias ni="npm install"
alias nt="npm test"
alias nr="npm run"

# Git shortcuts
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"

# Seus aliases específicos
alias doom="sh ~/.config/emacs/bin/doom"

# Docker aliases
alias dockerup="podman-compose up"
alias dockerdown="podman-compose stop"
alias dockerlist="podman machine list"

# Utility aliases
alias ll="ls -la"
alias la="ls -A"
alias l="ls -CF"
alias grep="grep --color=auto"
alias mkdir="mkdir -p"  
alias h="history"
alias j="jobs"
alias du="du -h"
alias df="df -h"
alias free="free -h"


# ===== FUNCTIONS =====
# Função melhorada para criar e entrar em diretório
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Função para buscar e matar processos
killp() {
  local pid
  if [ "$#" -ne 1 ]; then
    echo "Usage: killp <process_name>"
    return 1
  fi
  pid=$(ps -ef | grep -v grep | grep "$1" | awk '{print $2}')
  if [ -z "$pid" ]; then
    echo "No process found for: $1"
  else
    echo "Killing process $1 (PID: $pid)"
    kill "$pid"
  fi
}

# Função para extrair arquivos
extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)     echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# NVM 
nvm() {
  unset -f nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  nvm "$@"
}

# Node/npm
node() {
  unset -f node
  nvm use default
  node "$@"
}

npm() {
  unset -f npm
  nvm use default
  npm "$@"
}

# Rbenv 
rbenv() {
  unset -f rbenv
  if command -v rbenv >/dev/null 2>&1; then
    eval "$(rbenv init -)"
  fi
  rbenv "$@"
}

# OPAM (verificação antes de carregar)
if [[ -r '/Users/bonatto/.opam/opam-init/init.zsh' ]]; then
  source '/Users/bonatto/.opam/opam-init/init.zsh' >/dev/null 2>&1
  if command -v opam >/dev/null 2>&1; then
    eval $(opam env) 2>/dev/null
  fi
fi

# BUN (verificação)
if [[ -d "$HOME/.bun" ]]; then
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"
  [ -s "/Users/bonatto/.bun/_bun" ] && source "/Users/bonatto/.bun/_bun"
fi

# EMACS VTERM
if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
  alias clear='vterm_printf "51;Evterm-clear-scrollback";tput clear'
fi

# FZF (só se existir)
if command -v fzf >/dev/null 2>&1; then
  _fzf_complete_chatsh() {
    _fzf_complete --multi --reverse --prompt="chatsh> " -- "$@" < <(
      curl -s https://openrouter.ai/api/v1/models | jq -r '.data[].id' | sed 's/^/openrouter:/'
    )
  }
  [ -n "$BASH" ] && complete -F _fzf_complete_chatsh -o default -o bashdefault chatsh
fi

# ITERM2 (sempre por último)
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
