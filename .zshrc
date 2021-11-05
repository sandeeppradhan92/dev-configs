# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

ZSH_THEME="powerlevel10k/powerlevel10k"
if [ -f "${ZSH}/custom/themes/powerlevel10k/powerlevel10k.zsh-theme" ]; then
  source ${ZSH}/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
elif [ -f "${ZSH}/themes/powerlevel10k/powerlevel10k.zsh-theme" ]; then
  source ${ZSH}/themes/powerlevel10k/powerlevel10k.zsh-theme
elif [ -f "${HOME}/powerlevel10k/powerlevel10k.zsh-theme" ]; then
  source ${HOME}/powerlevel10k/powerlevel10k.zsh-theme
else
  echo "powerlevel10k folder not found"
fi

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

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    docker
    dotenv
    git
    git-flow
    golang
    history
    node
    npm
    pip
    pipenv
    python
    themes
    tmux
    vscode
    kubectl
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="source ~/.zshrc"
alias ohmyzsh="source ~/.oh-my-zsh"

if [ -f "${HOME}/.bash_aliases" ]; then
  source ${HOME}/.bash_aliases
fi


# Configuration for kubernetes completion
source <(kubectl completion zsh)
alias k=kubectl
complete -F __start_kubectl k
alias ll='ls -alF'

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

    alias snowsql=/Applications/SnowSQL.app/Contents/MacOS/snowsql
    # The next line updates PATH for the Google Cloud SDK.
    if [ -f '/Users/sandeeppradhan/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/sandeeppradhan/google-cloud-sdk/path.zsh.inc'; fi

    # The next line enables shell command completion for gcloud.
    if [ -f '/Users/sandeeppradhan/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/sandeeppradhan/google-cloud-sdk/completion.zsh.inc'; fi
    
    # Set path for google cloud sdk
    if [ -f '/Users/sandeeppradhan/google-cloud-sdk/bin' ]; then export PATH=$PATH:/Users/sandeeppradhan/google-cloud-sdk/bin; fi
    if [ -f '/Users/sandeeppradhan/Library/Application Support/cloud-code/installer/google-cloud-sdk/bin' ]; then export PATH=$PATH:'/Users/sandeeppradhan/Library/Application Support/cloud-code/installer/google-cloud-sdk/bin'; fi
    
    if [ -f /usr/local/etc/bash_completion ]; then /bin/bash /usr/local/etc/bash_completion; fi
else
    LS_COLORS='ow=01;36;40'
    export LS_COLORS
    # For airflow
  eval "$(~/.local/bin/register-python-argcomplete airflow)"
fi

##########################################################################################################################################


# For python startup file
export PYTHONSTARTUP=${HOME}/.pythonstartup


echo 'Plugin load complete'
