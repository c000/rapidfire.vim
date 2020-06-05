function! rapidfire#call(mods, name) abort
  let expr = rapidfire#store#get(a:name)

  call inputsave()
  try
    let expr = input(printf('Rapidfire[%s]: ', a:name), expr, 'command')
  finally
    call inputrestore()
  endtry

  if empty(expr)
    return
  endif

  call rapidfire#store#set(a:name, expr)
  execute a:mods expr
endfunction
