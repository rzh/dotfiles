#!env bash

if hash wget 2>/dev/null; then
    wget --no-check-certificate https://raw.githubusercontent.com/rzh/dotfiles/master/vim/vimrc -O $HOME/.vimrc
    wget --no-check-certificate https://raw.githubusercontent.com/rzh/dotfiles/master/tmux/tmux.conf -O $HOME/.tmux.conf
elif hash curl 2>/dev/null; then
    curl -o $HOME/.vimrc https://raw.githubusercontent.com/rzh/dotfiles/master/vim/vimrc
    curl -o $HOME/.tmux.conf https://raw.githubusercontent.com/rzh/dotfiles/master/tmux/tmux.conf 
else
    echo "Please install wget or curl"
fi

