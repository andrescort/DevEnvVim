#!/bin/bash

# # # # # # # # # # # # # # # # # # # #
#                                     #
# Create programming environment      #
#                                     #
# # # # # # # # # # # # # # # # # # # #

# Modules
. modules.sh


main () {
    show_step "Instalando dependencias" install_libraries
    show_step "Creando Respaldo" restore_files
    show_step "Configurando entorno completo de Vim" add_files
    show_step "Instalando plugins" install_plugins
    show_step "Configurando plugins" configs_plugins
    echo -e "\n¡A codear!\n" 
}

main

