function! rapidfire#call(mods, name) abort
  let expr = get(g:rapidfire#commands, a:name, '')

  call inputsave()
  try
    let expr = input(printf(g:rapidfire#prompt_format, a:name), expr, 'command')
    echo '' | redraw
  finally
    call inputrestore()
  endtry

  if empty(expr)
    return
  endif

  let g:rapidfire#commands[a:name] = expr
  if !empty(g:rapidfire#persistent_filename)
    call rapidfire#persistent#save(g:rapidfire#persistent_filename)
  endif

  doautocmd <nomodeline> User RapidfirePre
  execute a:mods expr
  doautocmd <nomodeline> User RapidfirePost
endfunction

function! rapidfire#load_persistent_file() abort
  if !empty(g:rapidfire#persistent_filename)
    call rapidfire#persistent#load(g:rapidfire#persistent_filename)
  endif
endfunction

" Configurations
let g:rapidfire#commands = get(g:, 'rapidfire#commands', {})
let g:rapidfire#persistent_filename = get(g:, 'rapidfire#persistent_filename', '')

" Unstable configurations
let g:rapidfire#prompt_format = 'Rapidfile[%s] :'
