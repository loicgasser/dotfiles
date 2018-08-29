if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

### Export variables
export LESS='-q'
export EDITOR=vim
export PATH=$HOME/local/bin:$HOME/bin:$PATH

### ls options
export LS_OPTIONS='--color=auto'
export HISTCONTROL=ignoredups
eval `dircolors`
alias ls='ls $LS_OPTIONS'
alias l='ls $LS_OPTIONS -Fahl'

### Custom bar
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
export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]${YELLOW}\$(parse_git_branch) ${WHITE}\n$ "
