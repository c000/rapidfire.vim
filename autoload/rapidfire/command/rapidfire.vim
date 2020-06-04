let g:rapidfire_commands = {}

function! rapidfire#command#rapidfire#call(mods, fargs) abort
  let command = get(g:rapidfire_commands, a:fargs, '')

  call inputsave()
  try
    let command = input(printf('Rapidfire[%s]: ', a:fargs), l:command, 'command')
  finally
    call inputrestore()
  endtry

  if empty(command)
    return
  endif

  let g:rapidfire_commands[a:fargs] = command
  execute command
endfunction
