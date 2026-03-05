if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# ~/.bash_profile
# Keep login env in ~/.profile; just source it here.
if [ -r ~/.profile ]; then
  . ~/.profile
fi
