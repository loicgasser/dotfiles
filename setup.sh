#!/bin/sh

cp -f .gitconfig ~/
cp -f .tmux.conf ~/
cp -f .vimrc ~/
cp -f .bash_profile ~/
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
