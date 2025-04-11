#!/bin/bash

# # # # # # # # # # # # # # # # # # # #
#                                     #
# Create programming environment      #
#                                     #
# # # # # # # # # # # # # # # # # # # #

# Modules
. modules.sh


main () {
    echo "Instalando dependencias"
    install_debian_libraries	
    echo "Respaldo"
    echo 
    restore_files
    echo "### Creando vimrc"
    echo 
    add_files
    echo "### Configurando Editor (vim)"
    echo 
    install_vim_plugins
    echo "### config_markdown"
    echo 
    #configure_markdown
    echo "## Instalalando y configurando jedi"
    install_config_jedi
}

main
