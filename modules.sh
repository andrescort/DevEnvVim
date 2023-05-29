#!/bin/bash

# # # # # # # # # # # # # # # # # # # #
#                                     #
# Create programming environment      #
#                                     #
# # # # # # # # # # # # # # # # # # # #

DIR_PLUGINS=$HOME/.vim/pack/plugins/start
COMPLEMENTS_VIM=./src

# Library necessary for thermux
lib_termux () {
    pkg update -y \
        && pkg upgrade -y \
        && pkg in vim git nodejs -y
}

# Necessary libraries debian
lib_system () {
    sudo apt update \
        && sudo apt upgrade \
        && sudo apt install vim nodejs 
}

# Installation and configuration of Vim8+ plugins
editor_codes () {
    mkdir -p $DIR_PLUGINS
    # Install markdown-preview
    git clone https://github.com/iamcco/markdown-preview.nvim.git $DIR_PLUGINS/markdown-preview
    # Install tagbar
    git clone https://github.com/preservim/tagbar.git $DIR_PLUGINS/tagbar
    git clone --branch release https://github.com/neoclide/coc.nvim.git --depth=1  $DIR_PLUGINS/coc
    echo "### Config vim"
    echo
    vim -c "helptags $HOME/.vim/pack/plugins/start/coc/doc/" -c "q"
    vim -c "packadd markdown-preview.nvim" -c "q"

}

# Add vimrc and .vim
add_files () {
    mv $COMPLEMENTS_VIM/vimrc $HOME/.vimrc
    mv $COMPLEMENTS_VIM/vim/* $HOME/.vim
}

# Install necessary modules for Markdown-Preview
config_markdown () {
    # cd ~/.vim/pack/plugins/start/markdown-preview &&
    echo "Fichero creado" # >> test.txt.txt
            # npm install
}
