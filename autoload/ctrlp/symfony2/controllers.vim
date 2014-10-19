if exists('g:loaded_ctrlp_symfony2_controllers') && g:loaded_ctrlp_symfony2_controllers
    finish
endif
let g:loaded_ctrlp_symfony2_controllers = 1

let s:controllers_var = {
\  'init':   'ctrlp#symfony2#controllers#init()',
\  'accept': 'ctrlp#symfony2#controllers#accept',
\  'lname':  'Symfony2 controllers',
\  'sname':  'sf2 contro',
\  'type':   'path',
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
    let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:controllers_var)
else
    let g:ctrlp_ext_vars = [s:controllers_var]
endif

let s:find = "cd %s; find src/ -path '*/Controller/*' ! -path '*/Tests/*' -type f ! -name '.*' -prune | sed 's_src/__'"

fun! ctrlp#symfony2#controllers#init()
    return ctrlp#symfony2#helpers#find(s:find)
endf

fun! ctrlp#symfony2#controllers#accept(mode, str)
    call ctrlp#acceptfile(a:mode, ctrlp#symfony2#helpers#symfony2_root() . '/src/' . a:str)
endf

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
fun! ctrlp#symfony2#controllers#id()
    return s:id
endf
