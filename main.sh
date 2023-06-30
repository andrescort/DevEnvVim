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
    echo 
#    lib_termux
    echo 
    echo "Respaldo"
    restore_files
    echo 
    read
    echo "### Creando vimrc"
    echo 
    add_files
    echo 
    read
    echo "### Configurando Editor (vim)"
    echo 
    editor_codes
    echo 
    read
    echo "### config_markdown"
    config_markdown
}

main

