if exists('g:loaded_ctrlp_symfony2_entities') && g:loaded_ctrlp_symfony2_entities
    finish
endif
let g:loaded_ctrlp_symfony2_entities = 1

let s:entities_var = {
\  'init':   'ctrlp#symfony2#entities#init()',
\  'accept': 'ctrlp#symfony2#entities#accept',
\  'lname':  'Symfony2 entities',
\  'sname':  'sf2 entities',
\  'type':   'path',
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
    let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:entities_var)
else
    let g:ctrlp_ext_vars = [s:entities_var]
endif

let s:find = "cd %s; find src/ \\( -path '*/Entity/*' -or -path '*/Resources/config/doctrine/*' \\) ! -path '*/Tests/*' -type f ! -name '.*' -prune | sed 's_src/__'"

fun! ctrlp#symfony2#entities#init()
    return ctrlp#symfony2#helpers#find(s:find)
endf

fun! ctrlp#symfony2#entities#accept(mode, str)
    call ctrlp#acceptfile(a:mode, ctrlp#symfony2#helpers#symfony2_root() . '/src/' . a:str)
endf

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
fun! ctrlp#symfony2#entities#id()
    return s:id
endf
