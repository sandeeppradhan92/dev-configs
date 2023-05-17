##########################################################################################################################################
### Star Ship [brew install starship]
##########################################################################################################################################
eval "$(starship init zsh)"


##########################################################################################################################################
### Autocomplete from history  [brew install zsh-autosuggestions]
##########################################################################################################################################
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh


##########################################################################################################################################
### Fuzzyfinder Configs  [brew install fzf fd]
##########################################################################################################################################
# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='**'

# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}


##########################################################################################################################################
### Aliases
##########################################################################################################################################

alias ll='ls -laF'
alias lll='ls -lartF'
alias weather='function _wtr(){curl wttr.in/$1 };_wt'r
alias back='cd $OLDPWD'
alias figlet3='figlet -f banner3 -c -w $(tput cols)'
alias python39='/usr/bin/python3'


##########################################################################################################################################
### Minikube [brew install minkube]
##########################################################################################################################################
minikube() {
  case $1 in
    on)
      shift
       command minikube start --extra-config=apiserver.service-account-signing-key-file=/var/lib/minikube/certs/sa.key \
          --extra-config=apiserver.service-account-key-file=/var/lib/minikube/certs/sa.pub \
          --extra-config=apiserver.service-account-issuer=kubernetes/serviceaccount \
          --network-plugin=cni --cni=calico \
          --driver=hyperkit --kubernetes-version=v1.22.2
      ;;
    off)
      shift
      command minikube stop
      ;;
    *)
      command minikube "$@";;
  esac
}


##########################################################################################################################################
### iterm integration
##########################################################################################################################################

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

autoload -U +X bashcompinit && bashcompinit


##########################################################################################################################################
### Applications or Drivers
##########################################################################################################################################
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/Users/sandeeppradhan/.local/bin:$PATH"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


##########################################################################################################################################
### pyenv setup  [brew install pyenv]
##########################################################################################################################################
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


echo 'Plugin load complete'
