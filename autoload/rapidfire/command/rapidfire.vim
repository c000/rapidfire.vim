function! rapidfire#command#rapidfire#call(mods, fargs) abort
  let command = rapidfire#store#get(a:fargs)

  call inputsave()
  try
    let command = input(printf('Rapidfire[%s]: ', a:fargs), l:command, 'command')
  finally
    call inputrestore()
  endtry

  if empty(command)
    return
  endif

  call rapidfire#store#set(a:fargs, command)
  execute command
endfunction
