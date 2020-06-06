if exists('g:rapidfire_loaded')
  finish
endif
let g:rapidfire_loaded = 1

command! -nargs=1 Rapidfire call rapidfire#call(<q-mods>, <f-args>)
