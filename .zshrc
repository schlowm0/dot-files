# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/schlowmo/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="agnoster"
POWERLEVEL9K_MODE='nerdfont-complete' # 'awesome-fontconfig'
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status anaconda time)

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
    git
    zsh-autosuggestions
    vi-mode
    autopep8
    pip
    virtualenv
    fzf
 )

source $ZSH/oh-my-zsh.sh

# Colors:
eval `dircolors ~/.dir_colors/dircolors`

# Highlighting:
source /home/schlowmo/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Large history file
HISTSIZE=10000000
SAVEHIST=10000000

# Prevent duplicates in history
setopt hist_ignore_all_dups hist_save_nodups

# Remove hostname:
prompt_context() {}

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls='ls --color=auto'
alias paper='cd ~/Dropbox/Papers/'
alias phd='cd ~/ownCloud/Documents/Studies/PhD/'
alias code='cd ~/Repositories/Code/'
alias repo=' cd ~/Repositories/'
alias db='cd ~/Dropbox/'
alias mucke='cd ~/Music/'
alias data='cd /media/schlowmo/Data/'
alias ini='sudo openvpn /etc/openvpn/ini_openvpn.conf &'
alias jaer='cd ~/Repositories/DVS/trunk/; sudo ./jAERViewer1.5_linux.sh'
alias franz='cd /home/schlowmo/Dropbox/Privat/franz; ./Franz &'
alias cop='xclip -selection clipboard'
#alias mp3id='find . -type f -iname '*.mp3' -exec vbrfix {} {} \;'
alias lsusr='cut -d: -f1 /etc/passwd'
alias ov='tree -I "__pycache__|__init__.py|*.pyc|*.log|*.aux|*.md"'
alias oc='cd ~/ownCloud'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/schlowmo/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/schlowmo/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/schlowmo/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/schlowmo/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

