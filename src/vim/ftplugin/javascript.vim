"           PLANTILLAS
"
   " Fold
    set foldmethod=marker
    set foldmarker={,}
    "       INDENTACIÓN
    set shiftwidth=2
    set tabstop=2

    " REACT
    nnoremap ,re :-1read $HOME/.vim/templates/react/estruc
    nnoremap ,rm :-1read $HOME/.vim/templates/react/module
    nnoremap ,rc :-1read $HOME/.vim/templates/react/estruclass
    
    inoremap ;<Tab> <Esc>F<lyt>A</<C-r>"><Esc>2ba
"           ATAJOS DE TECLADO
"

    " mapeo HTML
    "
    let b:id = "id="
    let b:class = "class="
    "inoremap ,<Tab> <esc>^"qcw<<C-r>q><esc>whxd$i class=''<esc>2br<Space>A</<C-r>q>
    "div#main.main
    " Cierre de etiquetas html
