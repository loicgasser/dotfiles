#!/bin/sh

cp -f .gitconfig ~/
cp -f .tmux.conf ~/
cp -f .vimrc ~/
cp -f .bash_profile ~/
cp -f saveagent.sh ~/.ssh/saveagent
if [ -f ~/.bashrc ]; then
    mv ~/.bashrc ~/bashrc
    cat ~/bashrc .bashrc > ~/.bashrc
    rm -f ~/bashrc
else
    cp -f .bashrc ~/.bashrc
fi
touch ~/.pgpass
chmod go-rwx ~/.pgpass
touch ~/.boto
chmod go-rwx ~/.boto
mkdir -p ~/.aws
touch ~/.aws/credentials
chmod go-rwx ~/.aws/credentials
curl -k https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash


mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle
git clone https://github.com/scrooloose/syntastic.git

npm install jshint
