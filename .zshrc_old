command neofetch
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


eval "$(starship init zsh)"

#
# Declare the variable
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=255'

ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=197'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=197'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=197'

# commands like echo git npm
ZSH_HIGHLIGHT_STYLES[builtin]='fg=119'
ZSH_HIGHLIGHT_STYLES[alias]='fg=119'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=119'
ZSH_HIGHLIGHT_STYLES[command]='fg=119'

ZSH_HIGHLIGHT_STYLES[default]='fg=255'


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    dotenv
    git
    golang
    history
    themes
    tmux
    kubectl
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
)


# User configuration


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="source ~/.zshrc"

if [ -f "${HOME}/.bash_aliases" ]; then
  source ${HOME}/.bash_aliases
fi



# For bash completion
autoload bashcompinit
bashcompinit
autoload -U compinit && compinit


##########################################################################################################################################
###################################################### Linux specific configuration ######################################################
##########################################################################################################################################
if [[ $OSTYPE == 'darwin'* ]]; then
    echo 'macOS' >> /dev/null
else
    export PATH=$HOME/.local/bin/kubectl:$HOME/bin:/usr/local/bin:/sbin:/usr/sbin:$PATH
fi
#export PATH=$HO:ME/bin:/usr/local/bin:/sbin:/usr/sbin:$PATH

##########################################################################################################################################




##########################################################################################################################################
###################################################### MAC specific configuration ########################################################
##########################################################################################################################################
# For mac terminal color
if [[ $OSTYPE == 'darwin'* ]]; then
    export CLICOLOR=1
    export LSCOLORS=GxFxCxDxBxegedabagaced

    # Command to kill microsoft defender
    alias kill_md="launchctl unload /Library/LaunchAgents/com.microsoft.wdav.tray.plist"

    alias snowsql=/Applications/SnowSQL.app/Contents/MacOS/snowsql
    # The next line updates PATH for the Google Cloud SDK.
    if [ -f '/Users/sandeeppradhan/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/sandeeppradhan/google-cloud-sdk/path.zsh.inc'; fi

    # The next line enables shell command completion for gcloud.
    if [ -f '/Users/sandeeppradhan/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/sandeeppradhan/google-cloud-sdk/completion.zsh.inc'; fi

    # Set path for google cloud sdk
    if [ -d '/Users/sandeeppradhan/google-cloud-sdk/bin' ]; then export PATH=/Users/sandeeppradhan/google-cloud-sdk/bin:$PATH; fi
    if [ -d /Users/sandeeppradhan/Library/Application\ Support/cloud-code/installer/google-cloud-sdk/bin ]; then export PATH=$PATH:'/Users/sandeeppradhan/Library/Application Support/cloud-code/installer/google-cloud-sdk/bin'; fi

    if [ -f /usr/local/etc/bash_completion ]; then /bin/bash /usr/local/etc/bash_completion; fi
    source ~/.minikube-completion
else
    LS_COLORS='ow=01;36;40'
    export LS_COLORS
    # For airflow
  eval "$(~/.local/bin/register-python-argcomplete airflow)"
fi

# setup istioctl path
if [ -d $HOME/.istioctl/bin ]; then export PATH=$PATH:$HOME/.istioctl/bin; fi

# setup PATH for go binaries
export PATH=$PATH:$HOME/go/bin/
export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.7/bin/
##########################################################################################################################################


# For python startup file
export PYTHONSTARTUP=${HOME}/.pythonstartup


##########################################################################################################################################
### Vim and nvim specific configs and env vars
##########################################################################################################################################

# chnages in nvim or vim fzf search default command
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi


##########################################################################################################################################
### Aliases
##########################################################################################################################################

alias ll='ls -laF'
alias lll='ls -lartF'
alias weather='function _wtr(){curl wttr.in/$1 };_wt'r
alias back='cd $OLDPWD'
alias figlet3='figlet -f banner3 -c -w $(tput cols)'
alias python38='/usr/local/opt/python@3.8/bin/python3.8'
alias python39='/usr/local/opt/python@3.9/bin/python3.9'
alias python310='/usr/local/opt/python@3.10/bin/python3.10'
alias python311='/usr/local/opt/python@3.11/bin/python3.11'

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
echo 'Plugin load complete'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform


#######Star Ship
source /usr/local/opt/nvm/nvm.sh
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/Users/sandeeppradhan/.local/bin:$PATH"
