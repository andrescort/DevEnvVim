function! InsertBlockName()
  " Guarda la última palabra editada antes de cambiarla.
  let last_word = '$BlockName'

  " Espera a que el usuario ingrese el reemplazo y presione <Esc> para continuar.
  let replacement = input('Block Name: ')

  " Ejecuta el reemplazo en todas las coincidencias sin solicitar confirmación.
  execute '%s/' . escape(last_word, '/') . '/' . escape(replacement, '/') . '/g'

endfunction


" Mapeo de teclas para ejecutar EditLastWord() en modo normal.
nnoremap <leader>cf :-1read $HOME/.vim/templates/html/ControlFlowJinja.vim<CR>:call InsertBlockName()<CR>
