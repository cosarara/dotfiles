zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
#zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle :compinstall filename '/home/cosarara/.zshrc'

autoload -U compinit promptinit
compinit
promptinit

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob
bindkey -e

#prompt steeef
#source ~/.zsh/steeef.zsh-theme
source ~/.zsh/steeef_custom.zsh-theme
#source ~/.zsh/mh.zsh-theme

source ~/.zsh/editor.zsh

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias maxima=rmaxima

alias ansicat=~/utils/ansicat.py

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

export DEVKITPRO=~/devkitpro
export DEVKITARM=$DEVKITPRO/devkitARM
export TONCCODE=$DEVKITPRO/tonc

export TERMINAL="konsole"
export EDITOR="vim"
export VISUAL="vim"
export WINEDLLOVERRIDES="winemenubuilder.exe=d"
export WINEARCH="win32"
export BROWSER="firefox"
#export QT_STYLE_OVERRIDE="breeze"

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

export SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS=0

export PATH=$HOME/.gem/ruby/2.1.0/bin:$PATH
export PATH=$HOME/bin:$PATH

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

[[ $TTY == "/dev/tty1" ]] && exec startx

alias top=htop

eval $(dircolors ~/.dircolors)
#alias ssh='TERM=xterm-256color ssh'
ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'
