if exists('g:loaded_ctrlp_symfony_configs') && g:loaded_ctrlp_symfony_configs
    finish
endif
let g:loaded_ctrlp_symfony_configs = 1

let s:configs_var = {
\  'init':   'ctrlp#symfony#configs#init()',
\  'accept': 'ctrlp#symfony#configs#accept',
\  'lname':  'Symfony configs',
\  'sname':  'sf configs',
\  'type':   'path',
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
    let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:configs_var)
else
    let g:ctrlp_ext_vars = [s:configs_var]
endif

fun! ctrlp#symfony#configs#find()
    let paths = [
        \'app/config',
        \'src/**/Resources/config',
        \'src/*/*/Resources/config',
        \'src/*/*/*/Resources/config',
    \]

    return ctrlp#symfony#find(paths, '**/[^.]*.*', g:ctrlp_symfony_ignore_tests_pattern)
endf

fun! ctrlp#symfony#configs#init()
    let results = ctrlp#symfony#configs#find()

    return map(results, 'fnamemodify(v:val, ":s?src/??:s?app/??")')
endf

fun! ctrlp#symfony#configs#accept(mode, str)
    let root = ctrlp#symfony#get_root()

    if filereadable(printf('%s/app/%s', root, a:str))
        call ctrlp#acceptfile(a:mode, printf('%s/app/%s', root, a:str))
    else
        call ctrlp#acceptfile(a:mode, printf('%s/src/%s', root, a:str))
    endif
endf

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
fun! ctrlp#symfony#configs#id()
    return s:id
endf
