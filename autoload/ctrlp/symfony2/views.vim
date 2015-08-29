if exists('g:loaded_ctrlp_symfony2_views') && g:loaded_ctrlp_symfony2_views
    finish
endif
let g:loaded_ctrlp_symfony2_views = 1

let s:views_var = {
\  'init':   'ctrlp#symfony2#views#init()',
\  'accept': 'ctrlp#symfony2#views#accept',
\  'lname':  'Symfony2 views',
\  'sname':  'sf2 views',
\  'type':   'path',
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
    let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:views_var)
else
    let g:ctrlp_ext_vars = [s:views_var]
endif

let s:find = "cd %s; find app/ src/ -path '*/Resources/views/*' -type f ! -name '.*' -prune"

fun! ctrlp#symfony2#views#init()
    return ctrlp#symfony2#helpers#find(s:find)
endf

fun! ctrlp#symfony2#views#accept(mode, str)
    call ctrlp#acceptfile(a:mode, ctrlp#symfony2#helpers#symfony2_root() . '/' .a:str)
endf

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
fun! ctrlp#symfony2#views#id()
    return s:id
endf
