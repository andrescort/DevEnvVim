" TAGBAR
  nnoremap <leader>. :TagbarToggle<CR>
  let g:tagbar_autofocus = 1
  let g:tagbar_width = 30

" Indent guides
  let g:indent_guides_enable_on_vim_startup = 1

" NerdTree
  autocmd VimEnter * NERDTree | wincmd p
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
