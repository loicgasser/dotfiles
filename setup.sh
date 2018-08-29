#!/bin/sh

echo 'Hi bro, I am gona tweak your home a notch, but not too much :D !!'

BASEDIR=$(pwd)
echo $BASEDIR

### Create symlinks for dotgile
for file in $(ls ${BASEDIR}/dotfiles)
do
  if [ ! -f $BASEDIR/dotfiles/$file ]; then
    echo "Setting up $file ..."
    ln -s $BASEDIR/dotfiles/$file ~/
  fi
done

### Create AWS/PostgreSQL related file
touch ~/.pgpass
chmod go-rwx ~/.pgpass
touch ~/.boto
chmod go-rwx ~/.boto
mkdir -p ~/.aws
touch ~/.aws/credentials
chmod go-rwx ~/.aws/credentials
if [ ! ~/.git-completion.bash ]; then
  curl -k https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
fi

### Vim tweaks with pathogen and synastic
if [ ! -f ~/.vim/autoload/pathogen.vim ]; then
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

if [ ! -d ~/.vim/bundle/syntastic ]; then
  cd ~/.vim/bundle
  git clone https://github.com/scrooloose/syntastic.git
  npm install jshint
fi
