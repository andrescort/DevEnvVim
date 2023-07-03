#!/bin/bash

# # # # # # # # # # # # # # # # # # # #
#                                     #
# Create programming environment      #
#                                     #
# # # # # # # # # # # # # # # # # # # #

# Modules
. modules.sh


# Main
main () {
    echo ----
    echo "### Instalando librerias necesarias"
#    lib_termux
    echo 
    echo "Respaldo"
    echo 
    restore_files
    echo "### Creando vimrc"
    echo 
    add_files
    echo "### Configurando Editor (vim)"
    echo 
    editor_codes
    echo "### config_markdown"
    echo 
    config_markdown
}

main
