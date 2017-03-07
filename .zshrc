# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1 blue green green

# Autoload
autoload colors
colors

autoload zcalc

# options
setopt histignorealldups sharehistory
setopt INTERACTIVE_COMMENTS

setopt autocd

# Use emacs keybindings even if our EDITOR is set to vi
#bindkey -e

# Bindkey
bindkey ' ' magic-space

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# 
setopt share_history
#setopt hist_ignore_all_dups

# Functions

# cd and ls 
function cs {
    cd "$@" && ls -lf
}

# date and cal
function date-cal {
    date && echo '' && cal
}

# sample
function hoge {
    echo hoge hage hige hage
}

# Aliases
alias l1='ls -1'
alias la='ls -laF'
alias ll='ls -lF'

alias ...='cd ../..'
alias ....='cd ../../..'

alias mkdir='mkdir -pv'

alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

alias rand='echo $(((RANDOM%10)+1))'

# Global aliases
#alias -g l='| ll' 
alias -g L='| less'
alias -g NUL="> /dev/null 2>&1"

# Hashes 
#hash -d xxsrc=$HOME/xx/src
hash -d log=/var/log

# Hashes: apache2
hash -d www=/var/www
hash -d sites-avail=/etc/apache2/sites-available
hash -d mod-avail=/etc/apache2/mods-available

# History expansion
#set NO_BANG_HIST
setopt HIST_VERIFY
set histchars='@^#'

source /home/pi/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
