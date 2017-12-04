#! /bin/bash

SHELL=$SHELL

if [[ $SHELL == *"zsh"* ]]; 
then
    echo "Already Installed Oh My Zsh!"
else
    echo "Install Oh My Zsh[https://github.com/robbyrussell/oh-my-zsh]"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Install Homebrew
echo "Install Homebrew[https://brew.sh/index_ko.html]"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Vim-Plug
echo "Install vim-plug[https://github.com/junegunn/vim-plug]"
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# zshrc
ln -sf ${PWD}/zsh/zshrc ~/.zshrc
source ~/.zshrc

# vimrc
echo "Install Neovim"
brew install neovim
# ln -sf ${PWD}/vim/vimrc ~/.vimrc 
ln -sf ${PWD}/vim/vimrc ~/.config/nvim/init.vim 
echo "Install Neovim Plugin"
vim +PlugInstall +qall

# vim snippets
# mkdir -p ~/.vim/snippets
mkdir -p ~/.config/nvim/snippets
ln -sf ${PWD}/vim/snippets/* ~/.config/nvim/snippets/

# tmux.conf
ln -sf ${PWD}/tmux/tmux.conf ~/.tmux.conf 

# tat
sudo ln -sf ${PWD}/bin/tat /usr/local/bin/tat

echo 'DONE!'
