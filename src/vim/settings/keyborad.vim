" CONFIGURACION ATAJOS DE TECLADO
  " Tecla líder
  let mapleader = ","
  " Auto completar, cierre de pares
  inoremap ( ()<Esc>i
  inoremap (<CR> (<CR>)<Esc>O
  inoremap { {}<Esc>i
  inoremap {<CR> {<CR>}<Esc>O
  inoremap [ []<Esc>i
  inoremap [<CR> [<CR>]<Esc>O
  inoremap < <><Esc>i
  inoremap ' ''<Esc>i
  inoremap " ""<Esc>i
  " LLAMAR SHELL
  nnoremap - !!$SHELL<Enter>
  " LLAMAR DICCIONARIO ESPAÑOL
  nnoremap \ :setlocal spell! spelllang=es<Enter>
  "           GUIAS
  inoremap ;g <++>
  inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
  vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
  nnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
  "           PLANTILLAS
  " Comentario de cabezera
  nnoremap ,h :-1read $HOME/.vim/templates/head<CR>
  " HTML Bootstrap
  nnoremap ,bh :-1read $HOME/.vim/templates/html/bootstrap_sk.html<CR>
  "    Open MarkdownPreview
  nnoremap <leader>; :MarkdownPreview<CR>
  " OKULAR
  " open preview file
  command! -nargs=0 Okular :!okular --presentation % &>/dev/null &


