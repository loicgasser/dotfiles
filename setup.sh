#!/bin/sh

cp -f .gitconfig ~/
cp -f .tmux.conf ~/
cp -f .vimrc ~/
cp -f .bash_profile ~/
cp -f .bashrc ~/
touch ~/.pgpass
chmod go-rwx ~/.pgpass
curl -k https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
