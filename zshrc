[ "$TERM" != dumb ] && fortune | cowsay -f /usr/share/cows/hellokitty.cow -W 60

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zshrc

fpath=( ~/.zsh/functions $fpath )

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' menu select
#zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle :compinstall filename ~/.zshrc

autoload -U compinit promptinit
compinit
promptinit

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000000
SAVEHIST=10000000
setopt appendhistory autocd extendedglob
bindkey -e

#prompt steeef
#source ~/.zsh/steeef.zsh-theme
#source ~/.zsh/steeef_custom.zsh-theme
#source ~/.zsh/mh.zsh-theme

#case "$COLORTERM" in
#	"mate-terminal")
#		TERM='xterm-256color'
#		;;
#	"truecolor")
#		TERM='xterm-256color'
#		;;
#esac

case "$TERM" in
"dumb")
    PS1="> "
    ;;
xterm*|rxvt*|eterm*|screen*|st*|linux*)
    true
#    TERM='xterm-256color' # at least till sakura gets its shit together
    ;;
*)
    PS1="> "
    ;;
esac

source ~/.zsh/editor.zsh
##bindkey "${terminfo[khome]}" beginning-of-line
##bindkey "${terminfo[kend]}" end-of-line
#bindkey "^[[H" beginning-of-line
#bindkey "^[[F" end-of-line
#bindkey "^[[3~" delete-char
## dunno what term will send this, but some random blog post suggested it
#bindkey "^[3;5~" delete-char

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    if [ -r ~/.dircolors ]; then
        eval "$(dircolors -b ~/.dircolors)"
    else
        eval "$(dircolors -b)"
    fi
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
fi

# to only uncomment as a dirty hack if I want changes
# applied to new shells or something
#source ~/.profile

alias cp='cp -i'
alias mv='mv -i'
alias l='ls'
alias ll='ls -l'

alias maxima=rmaxima

alias ansicat=~/utils/ansicat.py

function unzipd() {
	zip=$(readlink -f -- "$1")
	dir="$(basename -- "$1" .zip)"
	if [[ -d "$dir" ]]; then
		echo dir exists
		return
	fi
	mkdir -- "$dir"
	unzip "$zip" -d ./"$dir"
}

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

[[ $TTY == "/dev/tty1" ]] && exec startx

alias top=htop
alias vim=nvim
alias visualizer='nausea /tmp/mpd.fifo'
alias visualizer2='cava -i fifo -p /tmp/mpd.fifo'

alias rg="rg --colors 'match:bg:yellow' --colors 'match:fg:black' --colors 'match:style:nobold' --colors 'line:fg:yellow' --colors 'line:style:bold' --colors 'path:fg:green' --colors 'path:style:bold'"

#eval $(dircolors ~/.dircolors)
#
alias stopwifi='sudo systemctl stop netctl-auto@wlp2s0'
alias killbg='kill ${${(v)jobstates##*:*:}%=*}'

#alias ssh='TERM=xterm-256color ssh'
#
#if ! pgrep -u $USER ssh-agent > /dev/null; then
#    ssh-agent > ~/.ssh-agent-thing
#fi
#if [[ "$SSH_AGENT_PID" == "" ]]; then
#    eval $(<~/.ssh-agent-thing)
#fi
#ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'

alias mosh='mosh --bind-server=any'

#fortune -a | cowsay -f $(ls /usr/share/cows/ | shuf -n1)
#fortune | cowsay -f /usr/share/cows/hellokitty.cow -W 60

. /usr/share/fzf/key-bindings.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='ag -g ""'

export FZF_CTRL_R_OPTS=-e

if [ $TERM = linux ]; then
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan'
fi
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan'

#PATH="/home/jaume/perl5/bin${PATH+:}${PATH}"; export PATH;
#PERL5LIB="/home/jaume/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="/home/jaume/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"/home/jaume/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/home/jaume/perl5"; export PERL_MM_OPT;
#
#source ~/.local/share/perl5/etc/bashrc

#if [ -n "$DESKTOP_SESSION" ];then
#    eval $(gnome-keyring-daemon --start)
#    export SSH_AUTH_SOCK
#fi

#exec fish
source ~/dotfiles/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/dotfiles/p10k.zsh ]] || source ~/dotfiles/p10k.zsh
