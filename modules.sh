#!/bin/bash

DIR_PLUGINS=$HOME/.vim/pack/plugins/start
COMPLEMENTS_VIM=./src
VM_JEDI=$HOME/.local/lib/jedi-server

# Install necessary libraries for Termux
install_termux_libraries ()
{
    pkg update -y \
        && pkg upgrade -y \
        && pkg in vim git nodejs -y
}

# Install necessary libraries for Debian-based systems
install_debian_libraries ()
{
    if which sudo;then   
        sudo apt update && sudo apt upgrade -y && sudo apt install vim nodejs npm -y
    else
        su -c 'apt update && apt upgrade -y && apt install vim nodejs npm -y'
    fi
}

# Installation and configuration of Vim8+ plugins
install_vim_plugins ()
{
    mkdir -p $DIR_PLUGINS
    # Install markdown-preview
    # git clone https://github.com/iamcco/markdown-preview.nvim.git $DIR_PLUGINS/markdown-preview
    # Install tagbar
    git clone https://github.com/preservim/tagbar.git $DIR_PLUGINS/tagbar
    git clone --branch release https://github.com/neoclide/coc.nvim.git --depth=1  $DIR_PLUGINS/coc
    echo "### Configurar Vim"
    echo
    vim -c "helptags $HOME/.vim/pack/plugins/start/coc/doc/" -c "qa"
    # vim -c "packadd markdown-preview.nvim" -c "qa"
    # Install vim-floaterm
    git clone https://github.com/voldikss/vim-floaterm $DIR_PLUGINS/vim-floaterm
}

# Install and configure Jedi
install_config_jedi()
{
    virtualenv $VM_JEDI
    $VM_JEDI/bin/pip install jedi-language-server
    sed -i 's|jedi_command_path|$HOME/.local/lib/jedi-server/bin/jedi-language-server|' $HOME/.vim/coc-settings.json
}

# Restore files
restore_files ()
{
    if [[ -d "$HOME/.vim" ]];then
        mkdir $COMPLEMENTS_VIM/restore_files
        mv $HOME/.vim/ $COMPLEMENTS_VIM/restore_files/vim
    fi
    if [[ -e "$HOME/.vimrc" ]];then
        mv $HOME/.vimrc $COMPLEMENTS_VIM/restore_files/vimrc
    fi
    ls $COMPLEMENTS_VIM
}


# Add vimrc and .vim files
add_files ()
{
    cp -R $COMPLEMENTS_VIM/vim/ $HOME/.vim
    cp $COMPLEMENTS_VIM/vimrc $HOME/.vimrc
}

# Install necessary modules for Markdown-Preview
configure_markdown ()
{
    echo "Fichero creado"
    npm i --prefix $DIR_PLUGINS/markdown-preview
}
