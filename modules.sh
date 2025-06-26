#!/bin/bash

DIR_PLUGINS=$HOME/.vim/pack/plugins/start
COMPLEMENTS_VIM=./src
VM_JEDI=$HOME/.local/lib/jedi-server
# Colors
cyan=$(tput setaf 6)
green=$(tput setaf 2)
red=$(tput setaf 1)
bold=$(tput bold)
reset=$(tput sgr0)
check="✔"
arrow="➤"
cross="✖"


show_step()
{
  local label="$1"
  shift
  local cmd=("$@")
  echo -e "${cyan}${arrow}${reset} ${bold}${label}...${reset}"
  if "${cmd[@]}" > /dev/null 2>&1; then
    echo -e "   ${green}${check}${reset} Completado..."
  else
    echo -e "   ${red}${cross}${reset} Error durante..."
  fi
}

# Restore files
restore_files ()
{
    mkdir $HOME/restore_vim_files
    if [[ -d "$HOME/.vim" ]];then
        mv $HOME/.vim/ $HOME/restore_vim_files/vim
    fi
    if [[ -e "$HOME/.vimrc" ]];then
        mv $HOME/.vimrc $HOME/restore_vim_files/vimrc
    fi
}

# Add vimrc and .vim files
add_files ()
{
    cp -R $COMPLEMENTS_VIM/vim/ $HOME/.vim
    cp $COMPLEMENTS_VIM/vimrc $HOME/.vimrc
}

install_termux_libraries ()
{
    pkg update -y \
        && pkg upgrade -y \
        && pkg in vim git nodejs -y
}

install_debian_libraries ()
{
    if which sudo >/dev/null 2>&1 ;then
        sudo apt update >/dev/null 2>&1 \
            && sudo apt upgrade -y >/dev/null 2>&1 \
            && sudo apt install vim nodejs npm universal-ctags -y >/dev/null 2>&1
    else
        su -c 'apt update && apt upgrade -y && apt install vim nodejs npm -y' >/dev/null 2>&1
    fi
}

install_arch_libraries ()
{
    if which sudo; then
        sudo pacman -Syu && sudo pacman -S vim nodejs npm python-virtualenv ctags -y
    else
        su -c 'pacman -Syu && pacman -S vim nodejs npm -y'
    fi
}

# Detecta el PM 
install_libraries ()
{
  for cmd in apt pacman pkg; do
    if command -v "$cmd" &>/dev/null; then
      break
    fi
  done
  case "$cmd" in
    apt)     install_debian_libraries ;;
    pacman)  install_arch_libraries ;;
    pkg)     install_termux_libraries ;;
    *)      echo "No se soporta el gestor de paquetes: $PM" >&2; exit 1 ;;
  esac
}

# Installation and configuration of Vim8+ plugins
install_plugins ()
{
    mkdir -p $DIR_PLUGINS
    # Install tagbar
    git clone https://github.com/preservim/tagbar.git $DIR_PLUGINS/tagbar >/dev/null 2>&1
    git clone --branch release https://github.com/neoclide/coc.nvim.git --depth=1  $DIR_PLUGINS/coc >/dev/null 2>&1
    git clone https://github.com/junegunn/vim-peekaboo $DIR_PLUGINS/peekaboo >/dev/null 2>&1
    git clone https://github.com/ap/vim-css-color.git $DIR_PLUGINS/css-color >/dev/null 2>&1
    git clone https://github.com/chrisbra/NrrwRgn $DIR_PLUGINS/NrrwRgn >/dev/null 2>&1
    git clone https://github.com/dense-analysis/ale $DIR_PLUGINS/ale >/dev/null 2>&1
    git clone https://github.com/preservim/vim-indent-guides $DIR_PLUGINS/indent-guides >/dev/null 2>&1
    git clone https://github.com/tomtom/tcomment_vim $DIR_PLUGINS/tcomment_vim >/dev/null 2>&1
    git clone https://github.com/preservim/nerdtree $DIR_PLUGINS/nerdtree >/dev/null 2>&1
    git clone https://github.com/ryanoasis/vim-devicons $DIR_PLUGINS/devicons >/dev/null 2>&1
    git clone https://github.com/junegunn/vim-easy-align $DIR_PLUGINS/easy-align >/dev/null 2>&1
    git clone https://github.com/voldikss/vim-floaterm $DIR_PLUGINS/vim-floaterm >/dev/null 2>&1
}

configs_plugins ()
{
    vim -c "helptags $HOME/.vim/pack/plugins/start/coc/doc/" -c "qa"
    virtualenv $VM_JEDI >/dev/null 2>&1
    $VM_JEDI/bin/pip install jedi-language-server >/dev/null 2>&1
    sed -i 's|jedi_command_path|$HOME/.local/lib/jedi-server/bin/jedi-language-server|' $HOME/.vim/coc-settings.json
}


