if exists('g:loaded_ctrlp_symfony_services') && g:loaded_ctrlp_symfony_services
    finish
endif
let g:loaded_ctrlp_symfony_services = 1

let s:services_var = {
\  'init':   'ctrlp#symfony#services#init()',
\  'accept': 'ctrlp#symfony#services#accept',
\  'lname':  'Symfony services',
\  'sname':  'sf services',
\  'type':   'path',
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
    let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:services_var)
else
    let g:ctrlp_ext_vars = [s:services_var]
endif

let s:services = {}

fun! ctrlp#symfony#services#init()
    let s:services = symfony#get_services()

    return keys(s:services)
endf

fun! ctrlp#symfony#services#accept(mode, str)
    let root = symfony#get_root()

    let class = symfony#get_service_class(a:str, s:services)

    let file = symfony#composer_find_file(class)

    call ctrlp#acceptfile(a:mode, file)
endf

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
fun! ctrlp#symfony#services#id()
    return s:id
endf
