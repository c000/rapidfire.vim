if exists('g:rapidfire_loaded')
  finish
endif
let g:rapidfire_loaded = 1

augroup rapidfire_internal
  autocmd! *
  autocmd VimEnter * call rapidfire#load_persistent_file()
  autocmd User RapidfirePre :
  autocmd User RapidfirePost :
augroup END

command! -nargs=1 Rapidfire call rapidfire#call(<q-mods>, <f-args>)
command! -nargs=1 RapidfireImmediate call rapidfire#call(<q-mods>, <f-args>, { 'immediate': 1 })
