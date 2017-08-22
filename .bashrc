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
YELLOW='\e[0;33m'     # Yellow
WHITE='\e[0;37m'      # White
RESET='\e[0m'         # Text Reset
export PS1="\[\033[01;32m\]\u@\h ($USER)\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] ${YELLOW}\$(parse_git_branch) ${WHITE}\n$ "

MY_SOCK="/tmp/ssh-agent-$USER-screen"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $MY_SOCK ]
then
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $MY_SOCK
    export SSH_AUTH_SOCK=$MY_SOCK
fi
export PATH=$HOME/local/bin:$PATH
