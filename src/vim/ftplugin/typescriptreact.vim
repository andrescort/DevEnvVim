" JavaScript
  " Fold
  set foldmethod=marker
  set foldmarker={,}
  set foldmarker=>,</
  "       INDENTACIÓN
  set shiftwidth=2
  set tabstop=2
  " REACT
  nnoremap ,re :-1read $HOME/.vim/templates/react/estruc
  nnoremap ,rm :-1read $HOME/.vim/templates/react/module
  nnoremap ,rc :-1read $HOME/.vim/templates/react/estruclass
  inoremap ;<Tab> <Esc>F<lyt>A</<C-r>"><Esc>2ba
