if exists('g:loaded_ctrlp_symfony2_sources') && g:loaded_ctrlp_symfony2_sources
    finish
endif
let g:loaded_ctrlp_symfony2_sources = 1

let s:sources_var = {
\  'init':   'ctrlp#symfony2#sources#init()',
\  'accept': 'ctrlp#symfony2#sources#accept',
\  'lname':  'Symfony2 sources',
\  'sname':  'sf2 sources',
\  'type':   'path',
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
    let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:sources_var)
else
    let g:ctrlp_ext_vars = [s:sources_var]
endif

let s:find = "cd %s; find src/ app/ -type f ! -name '.*' ! -path 'app/cache/*' -prune"

fun! ctrlp#symfony2#sources#init()
  return ctrlp#symfony2#helpers#find(s:find)
endf

fun! ctrlp#symfony2#sources#accept(mode, str)
    call ctrlp#acceptfile(a:mode, ctrlp#symfony2#helpers#symfony2_root() . '/' . a:str)
endf

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
fun! ctrlp#symfony2#sources#id()
    return s:id
endf
