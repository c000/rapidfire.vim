function! rapidfire#call(mods, name, ...) abort
  let options = extend({
        \ 'immediate': 0,
        \}, a:0 ? a:1 : {},
        \)
  let expr = get(g:rapidfire#commands, a:name, '')

  if !options.immediate || empty(expr)
    call inputsave()
    try
      let expr = input(printf(g:rapidfire#prompt_format, a:name), expr, 'command')
      echo '' | redraw
    finally
      call inputrestore()
    endtry
    if empty(expr)
      return expr
    endif
    let g:rapidfire#commands[a:name] = expr
    if !empty(g:rapidfire#persistent_filename)
      call rapidfire#persistent#save(g:rapidfire#persistent_filename)
    endif
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
let g:rapidfire#prompt_format = 'Rapidfire[%s] :'
