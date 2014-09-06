# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples


RS="\[\033[0m\]"    # reset
HC="\[\033[1m\]"    # hicolor
UL="\[\033[4m\]"    # underline
INV="\[\033[7m\]"   # inverse background and foreground
FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[31m\]" # foreground red
FGRN="\[\033[32m\]" # foreground green
FYEL="\[\033[33m\]" # foreground yellow
FBLE="\[\033[34m\]" # foreground blue
FMAG="\[\033[35m\]" # foreground magenta
FCYN="\[\033[36m\]" # foreground cyan
FWHT="\[\033[37m\]" # foreground white
BBLK="\[\033[40m\]" # background black
BRED="\[\033[41m\]" # background red
BGRN="\[\033[42m\]" # background green
BYEL="\[\033[43m\]" # background yellow
BBLE="\[\033[44m\]" # background blue
BMAG="\[\033[45m\]" # background magenta
BCYN="\[\033[46m\]" # background cyan

#######################################################
# This file is controlled by puppet if it is in /etc! #
#######################################################

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

set completion-ignore-case on

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

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

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# commented out to default to PS1 in /etc/bash.bashrc
#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
	PS1="${debian_chroot:+($debian_chroot)}\t $FGRN\W$FWHT$HC\$$RS "
    ;;
*)
    ;;
esac

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

# some more ls aliases
alias l='ls -l'
alias ll='ls -Al'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# easily reload bashrc
alias src='source ~/.bashrc'

# set up paths for python and stuff
export GIT=$HOME/git
export BASE_PATH=$PATH

# oracle stuff
# check the location of your oracle files!
export ORACLE_HOME=/usr/lib/oracle/11.2/client64
export ORACLE_SID=XE
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH

# function to set up PROJ-Playtech paths
function genora {
	export PROJ_HOME=$GIT/multiop
	export PATH=$PATH:$PROJ_HOME/python/bin
	#PYTHONPATH=$PROJ_HOME/python/appserv
	export PYTHONPATH=$PYTHONPATH:$PROJ_HOME/python/lib
	$HOME/git/multiop/abettersqlplus/absp.py "$@"
}

function pt {
    export PROJ_HOME=$GIT/multiop
    export PATH=$BASE_PATH:$PROJ_HOME/python/bin
    
    export PYTHONPATH=$PYTHONPATH:$PROJ_HOME/python/lib
}

function pbfv {
    export PROJ_HOME=$GIT/PROJ-BetfairVirtual
    export PATH=$BASE_PATH:$PROJ_HOME/python/bin
    export PYTHONPATH=$PROJ_HOME/python/appserv
    export PYTHONPATH=$PYTHONPATH:$PROJ_HOME/python/resources/db/oracle
    export PYTHONPATH=$PYTHONPATH:$PROJ_HOME/python/lib
    export PYTHONPATH=$PYTHONPATH:$PROJ_HOME/python/apps/python
    export PYTHONPATH=$PYTHONPATH:$PROJ_HOME/python/userauth/python
    export PYTHONPATH=$PYTHONPATH:$PROJ_HOME/python/pools/utils
    export PYTHONPATH=$PYTHONPATH:$PROJ_HOME/feeds/python
    export PYTHONPATH=$PYTHONPATH:$PROJ_HOME/sportsbook/apps/python
    export PYTHONPATH=$PYTHONPATH:$PROJ_HOME/custacct/python
}


function vf {
	vim $(find . -name $1)
}

## open all files matching regex in vim
function vr {
	vim $(grep -lrs $1 ./)
}

function vrp {
	vim $(grep -lrs $1 $2)
}

set_term_title() { 
	echo -en "\033]0;$1\a"
}

runlog() {
	FILE="$1"
	FILENAME="${FILE%%.*}"
	./$FILE | tee -a "/home/cjeffery/serverlogs/${FILENAME}.log"
}

function sbserver {
	echo "starting server $1"
	set_term_title $1
	runlog $1
}

## pass options to free ## 
alias meminfo='free -m -l -t'
 
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
 
## Get server cpu info ##
alias cpuinfo='lscpu'
alias projector_attach='xrandr --output HDMI1 --auto --left-of LVDS1'
alias projector_detach='xrandr --output HDMI1 --off'
 
## older system use /proc/cpuinfo ##
##alias cpuinfo='less /proc/cpuinfo' ##
 
## get GPU ram on desktop / laptop## 
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

alias less='less -R'
# alias ack='~/bin/ack'
# alias tmux='~/bin/tmux'
# alias node='/space/bin/node'
# alias npm='/space/bin/npm'
alias sqlp='rlwrap /usr/lib/oracle/11.2/client64/bin/sqlplus'
alias nose='nosetests --rednose'

alias lock='i3lock -n -d -c 222830'

alias ie8='rdesktop -d GENEITY wintest-7.lohs.geneity -g 1800x1140'
alias ie8alt4='rdesktop wintest-4.lohs.geneity -g 1800x1140'
alias ie8alt1='rdesktop wintest-1.lohs.geneity -g 1800x1140'
alias ie9='rdesktop -d GENEITY wintest-8.lohs.geneity -g 1800x1140'
alias ie10='photoshop'
#alias ie9ps='rdesktop -d GENEITY wintest-8.lohs.geneity -g 1800x1140'
alias photoshop='rdesktop -d GENEITY wintest-9.lohs.geneity -g 1910x1180'
alias photoshopfullscreen='rdesktop -d GENEITY wintest-9.lohs.geneity -f'

alias pain='ie8'

alias watchsassbfv='cd ~/git/; sass --sourcemap --style expanded -I PROJ-BetfairVirtual/cms/apps/web/static/scss -I PROJ-BetfairVirtual/betfair_virtual/static/desktop/betfair_virtual/scss --watch PROJ-BetfairVirtual/betfair_virtual/static/desktop/betfair_virtual/scss:PROJ-BetfairVirtual/betfair_virtual/static/desktop/betfair_virtual/css'

export TERM="xterm-256color"


##PATH=$HOME/.local/bin:$PATH
##if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
##    source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
##fi

alias tmux='tmux -2'
alias intellij='~/intellij/bin/idea.sh'
alias nobeeps='sudo rmmod pcspkr'
alias wifi='sudo wifi-menu'

# export TERM="xterm-256color"
export CHROME_BIN=google-chrome-stable

export PATH=/space/bin:$HOME/scripts:$HOME/.gem/ruby/2.8/bin:$PATH
export PATH=/space/lib:$PATH

export PATH=$HOME/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/local/bin:$PATH
export PATH=$HOME/.meteor:$PATH
export PATH=$HOME/.gem/ruby/2.1.0/bin:$PATH
export PATH=$HOME/.gem/ruby/2.0.0/bin:$PATH
export PATH=$HOME/scripts:$PATH
export PATH=$HOME/dart/dart-sdk/bin:$PATH
export PATH=$HOME/intellij/bin/idea.sh:$PATH

export EDITOR=vim

# source $HOME/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh 

