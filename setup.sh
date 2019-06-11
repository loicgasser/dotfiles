#!/bin/bash

BASEDIR=$(pwd)

# return 1 if global command line program installed, else 0
program_is_installed () {
  # set to 1 initially
  local return_=1
  # set to 0 if not found
  type $1 >/dev/null 2>&1 || { local return_=0; }
  # return value
  echo "$return_"
}

add_source_bash_profile () {
  local lastline=$(tail -n -1 $HOME/.bashrc)
  if [ "source $HOME/.bash_profile" != "$lastline" ]; then
    echo "Add: source \$HOME/.bash_profile ..."
    echo "source $HOME/.bash_profile" >> $HOME/.bashrc
  fi
}

remove_source_bash_profile () {
  local lastline=$(tail -n -1 $HOME/.bashrc)
  if [ "source $HOME/.bash_profile" == "$lastline" ]; then
    echo "Remove: source \$HOME/.bash_profile ..."
    sed -i '$ d' $HOME/.bashrc
  fi
}

setup () {
  echo 'Hi bro, I am gona tweak your home a notch, but not too much :D !!'
  echo "Working from $BASEDIR ..."
  ### Create symlinks for dotgile
  rm -f ~/.profile ~/.bash_profile
  for file in $(ls -A ${BASEDIR}/dotfiles)
  do
    if [ ! -f ~/$file ]; then
      echo "Setting up $file ..."
      ln -s $BASEDIR/dotfiles/$file ~/
    fi
  done
  add_source_bash_profile

  ### Create AWS/PostgreSQL related file
  touch ~/.pgpass
  chmod go-rwx ~/.pgpass
  touch ~/.boto
  chmod go-rwx ~/.boto
  mkdir -p ~/.aws
  touch ~/.aws/credentials
  chmod go-rwx ~/.aws/credentials

  ### SSH and tmux
  mkdir -p ~/.ssh
  if [ ! -f ~/.ssh/rc ]; then
    echo "Adding ssh rc script ..."
    cp -f scripts/rc ~/.ssh/rc
  fi

  ### Vim tweaks with pathogen and synastic
  mkdir -p ~/.vim/autoload ~/.vim/bundle
  if [ ! -f ~/.vim/autoload/pathogen.vim ]; then
    echo "Setting up pathogen ..."
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
  fi

  if [ ! -d ~/vim/bundle/typescript-vim ]; then
    echo "Setting up syntax for typescript in vim"
    cd ~/.vim/bundle
    git clone https://github.com/leafgarland/typescript-vim.git
  fi
}

clean () {
  for file in $(ls -A ${BASEDIR}/dotfiles)
  do
    echo "Removing ~/$file"
    rm -f ~/$file
  done
  remove_source_bash_profile
  files=("$HOME/.pgpass" "$HOME/.boto" "$HOME/.ssh/rc")
  for file in "${files[@]}"
  do
    if [ -f $file ]; then
      echo "Removing $file"
      chmod go+rwx $file
      rm -f $file
    fi
  done
  direcs=("$HOME/.aws" "$HOME/.vim/autoload" "$HOME/.vim/bundle")
  for direc in "${direcs[@]}"
  do
    if [ -d $direc ]; then
      echo "Removing $direc"
      chmod go+rwx $direc
      rm -rf $direc
    fi
  done
}

if [ "$1" = "clean" ]; then
  clean
else
  setup
fi
