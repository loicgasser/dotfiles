# ~/.bashrc: executed by bash(1) for non-login shells.

export LESS='-q'
export EDITOR=vim

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
export HISTCONTROL=ignoredups
eval `dircolors`
alias ls='ls $LS_OPTIONS'
alias l='ls $LS_OPTIONS -Fahl'

# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

if [ `id -u` -eq 0 ]; then
  export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/bin/X11:/usr/games"
fi
# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
   PATH=~/bin:"${PATH}"
fi

if [ -f $HOME/.ssh/saveagent ]; then
  echo "Saving agent"
  . $HOME/.ssh/saveagent
fi

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

parse_git_branch()
{
  local BRANCH=$(git symbolic-ref HEAD --short 2> /dev/null)
  if [[ ! -z "$BRANCH" ]]
  then
    echo "**($BRANCH)**"
  fi
}
BLACK='\e[0;30m'      # Black - Regular
RED='\e[0;31m'        # Red
GREEN='\e[0;32m'      # Green
YELLOW='\e[0;33m'     # Yellow
BLUE='\e[0;34m'       # Blue
PURPLE='\e[0;35m'     # Purple
CYAN='\e[0;36m'       # Cyan
WHITE='\e[0;37m'      # White
BLACK_BOLD='\e[1;30m'   # Black - Bold
RED_BOLD='\e[1;31m'     # Red - Bold
GREEN_BOLD='\e[1;32m'   # Green - Bold
YELLOW_BOLD='\e[1;33m'  # Yellow - Bold
BLUE_BOLD='\e[1;34m'    # Blue - Bold
PURPLE_BOLD='\e[1;35m'  # Purple - Bold
CYAN_BOLD='\e[1;36m'    # Cyan - Bold
WHITE_BOLD='\e[1;37m'   # White - Bold
RESET='\e[0m'         # Text Reset
export PS1="\[\033[01;32m\]\u@\h (custom)\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] ${YELLOW}\$(parse_git_branch) ${WHITE}\n$ "

MY_SOCK="/tmp/ssh-agent-$USER-screen"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $MY_SOCK ]
then
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $MY_SOCK
    export SSH_AUTH_SOCK=$MY_SOCK
fi
export PATH=$HOME/local/bin:$PATH
