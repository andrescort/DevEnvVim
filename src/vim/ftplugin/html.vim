" HTML
  nnoremap ,html :-1read $HOME/.vim/templates/html/skeleton.html<CR>
  " Fold
  set foldmethod=indent
  " tabulacion html
  set shiftwidth=2
  set tabstop=2
  " Cierre de etiquetas html
  inoremap ;<Tab> <Esc>F<lyt>A</<C-r>"><Esc>2ba
