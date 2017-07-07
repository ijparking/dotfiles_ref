#! /bin/bash

# Install Vim-Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# create symbolic link

# vimrc
ln -sf ${PWD}/vim/vimrc ~/.vimrc 

# vim snippets
mkdir -p ~/.vim/snippets
ln -sf ${PWD}/vim/snippets/* ~/.vim/snippets/

# tmux.conf
ln -sf ${PWD}/tmux/tmux.conf ~/.tmux.conf 

# tat
sudo ln -sf ${PWD}/bin/tat /usr/local/bin/tat
