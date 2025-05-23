" Python
  nnoremap ,mpy :-1read $HOME/.vim/templates/python/imports.py<CR>
  nnoremap ,cy :-1read $HOME/.vim/templates/python/class.py<CR>
  nnoremap ,f :-1read $HOME/.vim/templates/python/function.py<CR>
  nnoremap ,cm :-1read $HOME/.vim/templates/python/comment.py<CR>
  " Fold
  set foldmethod=indent
  " CONFIGURACION POR EXTENCION
  " syntax on en requirements.txt python
  autocmd BufWritePre *.py :%s/\s\+$//e
  autocmd BufNewFile,BufRead requirements*.txt set ft=python
  " tab
  set shiftwidth=2
  set tabstop=2
  " Maximum line length
  set textwidth=79
