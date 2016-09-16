# ~/.bashrc: executed by bash(1) for non-login shells.

# Ben Sweedler's .bashrc
# Orgin: the CSL default by kkowal 2005-06-21.
# Hello World, are you ready to rock?

# If not running interactively, don't do anything
[ -z "$PS1" ] && return
export PS1="\e[0;35m\]\u@\[\e[10;35m\]\H \[\e[0;34m\]\w]\$ \[\e[0;32m\]"

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
   export TERM='xterm-256color'
else
   export TERM='xterm-color'
fi

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

#
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc).
#
[ -f /etc/bash_completion ] && . /etc/bash_completion

#
# `umask' is an octal bit mask which constrains the permissions you
# will grant to new files by default.  077 completely denies other users
# access to your files.  022 denies all other users write access.
#
umask 022

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then

    if [ -f ~/.dir_colors ]; then
       eval "`dircolors -b ~/.dir_colors`"
    fi

    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'


#gfind by dpatierno
gfind () { if [ $# -lt 2 ]; then files="*"; search="${1}"; else files="${1}"; search="${2}"; fi; find -P . -name "$files" -a ! -wholename '*/.*' -exec grep -Hin ${3} "$search" {} \; ; }

# set the path.
PATH=/bin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/lib64/java/bin:/usr/games
[ -d ~/bin ] && PATH=~/bin:$PATH

# i <3 vim
export EDITOR=vim
export SVN_EDITOR=vim
export GIT_EDITOR=vim

# less is more
export PAGER=less

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# move in bash like it's vi
set -o vi

#
# Run some extra scripts if they're around.
#
[ -f ~/.bashrc.`uname` ] && . ~/.bashrc.`uname`
[ -f ~/.bashrc.`hostname` ] && . ~/.bashrc.`hostname`
[ -f ~/.mybashrc ] && . ~/.mybashrc


# trying to get steam, ffmpeg to work
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/usr/lib64:/usr/local/lib64
