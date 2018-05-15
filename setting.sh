#! /bin/bash

if [[ "$(uname -s)" != "Darwin" ]];
then
    echo "=============================================="
    echo "              You're not using OSX.             "
    echo "=============================================="
    exit
fi

# zsh
source ${PWD}/zsh/setting.sh
ln -sf ${PWD}/zsh/zshrc ~/.zshrc

# Homebrew
source ${PWD}/brew/setting.sh

# Python
source ${PWD}/python/setting.sh

# Vim
source ${PWD}/vim/setting.sh

# tmux.conf
echo "=============================================="
echo "              Tmux                    "
echo "=============================================="
ln -sf ${PWD}/tmux/tmux.conf ~/.tmux.conf
ln -sf ${PWD}/bin/tat /usr/local/bin/tat

# virtualenv wrapper
echo "Install virtualenv virtualenvwrapper"
pip install virtualenv virtualenvwrapper
mkdir -p ~/.envs

zsh

echo 'DONE🎉🎉🎉
