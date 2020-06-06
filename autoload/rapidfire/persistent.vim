function! rapidfire#persistent#load(filename) abort
  let filename = fnamemodify(expand(a:filename), ':p')
  if filereadable(filename)
    let g:rapidfire#commands = json_decode(join(readfile(filename), "\n"))
  endif
endfunction

function! rapidfire#persistent#save(filename) abort
  let filename = fnamemodify(expand(a:filename), ':p')
  call mkdir(fnamemodify(filename, ':h'), 'p', 0700)
  echo json_encode(g:rapidfire#commands)
  call writefile([json_encode(g:rapidfire#commands)], filename)
endfunction
