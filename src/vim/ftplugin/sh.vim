" Bash
  nnoremap ,fsh :-1read $HOME/.vim/templates/bash/functions.sh<CR>
  nnoremap ,msh :-1read $HOME/.vim/templates/bash/main.sh<CR>
  nnoremap ,sh :-1read $HOME/.vim/templates/bash/shebang.sh<CR>
  nnoremap ,for :-1read $HOME/.vim/templates/bash/for.sh
  " Curl
  nnoremap ,cg :-1read $HOME/.vim/templates/bash/curlGET<CR>
  nnoremap ,cp :-1read $HOME/.vim/templates/bash/curlPOST<CR>
  " Foldmethod
  set foldmethod=marker
  set foldmarker={,}
