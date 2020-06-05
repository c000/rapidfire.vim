let s:rapidfire_commands = {}

function! rapidfire#store#get(key) abort
  return get(s:rapidfire_commands, a:key, '')
endfunction

function! rapidfire#store#set(key, command) abort
  let s:rapidfire_commands[a:key] = a:command
endfunction
