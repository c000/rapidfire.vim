function! rapidfire#call(mods, name) abort
  let expr = get(g:rapidfire#commands, a:name, '')

  call inputsave()
  try
    let expr = input(printf('Rapidfire[%s]: ', a:name), expr, 'command')
    echo '' | redraw
  finally
    call inputrestore()
  endtry

  if empty(expr)
    return
  endif

  let g:rapidfire#commands[a:name] = expr
  execute a:mods expr
endfunction

let g:rapidfire#commands = get(g:, 'rapidfire#commands', {})
