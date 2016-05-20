if exists('g:loaded_ctrlp_symfony_show_service') && g:loaded_ctrlp_symfony_show_service
    finish
endif
let g:loaded_ctrlp_symfony_show_service = 1

let s:show_service_var = {
\  'init':   'ctrlp#symfony#show_service#init()',
\  'accept': 'ctrlp#symfony#show_service#accept',
\  'lname':  'Symfony services',
\  'sname':  'sf services',
\  'type':   'path',
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
    let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:show_service_var)
else
    let g:ctrlp_ext_vars = [s:show_service_var]
endif

let s:services = {}

fun! ctrlp#symfony#show_service#init()
    let s:services = ctrlp#symfony#get_services()

    return keys(s:services)
endf

fun! ctrlp#symfony#show_service#accept(mode, str)
    call ctrlp#exit()
    call ctrlp#symfony#tmp_window('Symfony service @' . a:str, 'debug:container --no-ansi ' . a:str)
endf

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
fun! ctrlp#symfony#show_service#id()
    return s:id
endf
