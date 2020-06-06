function! rapidfire#call(mods, name) abort
  let expr = get(g:rapidfire#commands, a:name, '')

  call inputsave()
  try
    let expr = input(printf('Rapidfire[%s]:', a:name), expr, 'command')
    echo '' | redraw
  finally
    call inputrestore()
  endtry

  if empty(expr)
    return
  endif

  let g:rapidfire#commands[a:name] = expr
  doautocmd <nomodeline> User RapidfirePre
  execute a:mods expr
  doautocmd <nomodeline> User RapidfirePost
endfunction

" Register null autocmd to prevent 'No autocmd found' error
augroup rapidfire_internal
  autocmd! *
  autocmd User RapidfirePre :
  autocmd User RapidfirePost :
augroup END

" Configurations
let g:rapidfire#commands = get(g:, 'rapidfire#commands', {})
