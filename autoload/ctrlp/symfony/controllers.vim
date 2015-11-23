if exists('g:loaded_ctrlp_symfony_controllers') && g:loaded_ctrlp_symfony_controllers
    finish
endif
let g:loaded_ctrlp_symfony_controllers = 1

let s:controllers_var = {
\  'init':   'ctrlp#symfony#controllers#init()',
\  'accept': 'ctrlp#symfony#controllers#accept',
\  'lname':  'Symfony controllers',
\  'sname':  'sf contro',
\  'type':   'path',
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
    let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:controllers_var)
else
    let g:ctrlp_ext_vars = [s:controllers_var]
endif

fun! ctrlp#symfony#controllers#find()
    let paths = [
        \'src/*/Controller',
        \'src/*/*/Controller',
        \'src/*/*/*/Controller',
    \]

    return ctrlp#symfony#find(paths, '**/[^.]*Controller.php', g:ctrlp_symfony_ignore_tests_pattern)
endf

fun! ctrlp#symfony#controllers#init()
    let results = ctrlp#symfony#controllers#find()

    return map(results, 'fnamemodify(v:val, ":s?src/??:r")')
endf

fun! ctrlp#symfony#controllers#accept(mode, str)
    call ctrlp#acceptfile(a:mode, printf('%s/src/%s.php', ctrlp#symfony#get_root(), a:str))
endf

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
fun! ctrlp#symfony#controllers#id()
    return s:id
endf
