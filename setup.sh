#!/bin/sh

cp -f .gitconfig ~/
cp -f .tmux.conf ~/
cp -f .vimrc ~/
cp -f .bash_profile ~/
if [ -f ~/.bashrc ]; then
    mv ~/.bashrc ~/bashrc
    cat ~/bashrc .bashrc > ~/.bashrc
    rm -f ~/bashrc
else
    cp -f .bashrc ~/.bashrc
fi
touch ~/.pgpass
chmod go-rwx ~/.pgpass
curl -k https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
