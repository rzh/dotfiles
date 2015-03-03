#!env bash

if hash wget 2>/dev/null; then
    wget --no-check-certificate https://raw.githubusercontent.com/rzh/dotfiles/master/vim/vimrc -O $HOME/.vimrc
    wget --no-check-certificate https://raw.githubusercontent.com/rzh/dotfiles/master/tmux/tmux.conf -O $HOME/.tmux.conf

    # dealin with neobundle
    wget --no-check-certificate https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh -O - | sh
elif hash curl 2>/dev/null; then
    curl -o $HOME/.vimrc https://raw.githubusercontent.com/rzh/dotfiles/master/vim/vimrc
    curl -o $HOME/.tmux.conf https://raw.githubusercontent.com/rzh/dotfiles/master/tmux/tmux.conf 

    # dealin with neobundle
    curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
else
    echo "Please install wget or curl"
    exit
fi

# install vim bundles
~/.vim/bundle/neobundle.vim/bin/neoinstall

if $1=all; then
    sudo yum update -y
    yum groupinstall "Development Tools" "Development Libraries" tmux zsh vim git -y

fi
