" {% <++> %}<++>{% end$END %}

function! InsertBlockOrCFlow()
  let block_keywords = ['for', 'if', 'raw', 'macro', 'call', 'filter', 'set']
  let value = input('Block Name: ')
  if index(block_keywords, value) != -1
    " Si el valor de la variable está en la lista de palabras clave de bloque
    " Insertar el bloque correspondiente y posicionar el cursor en C1
    let block_start = "{% " . value . " <++> %}<++>{% end" . value . "%}"
    call append(line('.'), [block_start])
  else
    " Si el valor de la variable no está en la lista de palabras clave de bloque
    " Insertar el bloque genérico y posicionar el cursor en C1
    let block_start = "{% block " . value . " %} <++> {% endblock %}"
    call append(line('.'), [block_start])
  endif
endfunction


nnoremap <leader>cf :call InsertBlockOrCFlow()<CR>
nnoremap <leader>ex :-1read /home/andbna/.vim/templates/jinja/Expressions.jinja<CR><Esc>/<++><Enter>"_c4l
nnoremap <leader>cm :-1read /home/andbna/.vim/templates/jinja/Comments.jinja<CR><Esc>/<++><Enter>"_c4l

" Fold
set foldmethod=indent
" tabulacion html
set shiftwidth=2
set tabstop=2
" Cierre de etiquetas html
inoremap ;<Tab> <Esc>F<lyt>A</<C-r>"><Esc>2ba
