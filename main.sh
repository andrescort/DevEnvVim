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
    echo "### Configurando Editor (vim)"
    echo 
#    editor_codes
    echo 
    echo "### Creando vimrc"
    echo 
#    add_files
    echo 
    echo ----
    config_markdown
}

main

