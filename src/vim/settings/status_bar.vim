" Dictionary of full names
  let g:mode_dict = {
              \ 'n': 'Normal',
              \ 'no': 'Operator-pending',
              \ 'v': 'Visual',
              \ 'V': 'V·Line',
              \ "\<C-V>": 'V·Block',
              \ 's': 'Select',
              \ 'S': 'S·Line',
              \ "\<C-S>": 'S·Block',
              \ 'i': 'Insert',
              \ 'R': 'Replace',
              \ 'Rv': 'V·Replace',
              \ 'c': 'Command',
              \ 'cv': 'Vim Ex',
              \ 'ce': 'Ex',
              \ 'r': 'Prompt',
              \ 'rm': 'More',
              \ 'r?': 'Confirm',
              \ '!': 'Shell',
              \ 't': 'Terminal',
              \ }

  " Status Bar
  set laststatus=2
  set statusline=%{get(g:mode_dict,mode(),mode())}\ %f\ %=%l/%L\ [%p%%]\ %=%c,%v\ %h%m%r%{&ff}%<
