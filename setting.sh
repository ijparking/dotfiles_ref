#! /bin/bash

SHELL=$SHELL

echo "=============================================="
echo "                  Oh My Zsh                   "
echo "=============================================="

if [[ $SHELL == *"zsh"* ]];
then
    echo "Already Installed Oh My Zsh!"
else
    echo "Install Oh My Zsh[https://github.com/robbyrussell/oh-my-zsh]..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# zshrc
ln -sf ${PWD}/zsh/zshrc ~/.zshrc

if [[ "$(uname -s)" == "Darwin" ]];
then
    echo "=============================================="
    echo "              Homebrew                    "
    echo "=============================================="
    if [[ "$(which brew)" == "/usr/local/bin/brew" ]];
    then
        echo "Already Installed Homebrew!"
    else
        echo "Install Homebrew[https://brew.sh/index_ko.html]..."
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
fi

echo "=============================================="
echo "                      Vim                     "
echo "=============================================="
while true; do
    read -p "Do you wish to install Neovim? [y/n]" yn
    case $yn in
        [Yy]* ) VIM="NEOVIM"; break;;
        [Nn]* ) VIM="VIM"; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

if [[ $VIM == "NEOVIM" ]];
then
    echo "Install Neovim..."
    brew install neovim
    echo "Install vim-plug[https://github.com/junegunn/vim-plug] for Neovim"
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ln -sf ${PWD}/vim/vimrc ~/.config/nvim/init.vim
    echo "Install Neovim Plugin"
    nvim +PlugInstall +qall
    mkdir -p ~/.config/nvim/snippets
    ln -sf ${PWD}/vim/snippets/* ~/.config/nvim/snippets/
else
    echo "Install Vim..."
    brew install vim
    echo "Install vim-plug[https://github.com/junegunn/vim-plug] for Vim"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ln -sf ${PWD}/vim/vimrc ~/.vimrc
    echo "Install Neovim Plugin"
    vim +PlugInstall +qall
    mkdir -p ~/.vim/snippets
    ln -sf ${PWD}/vim/snippets/* ~/.vim/snippets/
fi

# tmux.conf
ln -sf ${PWD}/tmux/tmux.conf ~/.tmux.conf

# tat
sudo ln -sf ${PWD}/bin/tat /usr/local/bin/tat

# virtualenv wrapper
pip install virtualenv virtualenvwrapper
mkdir -p ~/.envs

source ~/.zshrc

echo 'DONE!'
