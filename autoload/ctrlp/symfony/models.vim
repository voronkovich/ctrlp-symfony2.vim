if exists('g:loaded_ctrlp_symfony_models') && g:loaded_ctrlp_symfony_models
    finish
endif
let g:loaded_ctrlp_symfony_models = 1

let s:models_var = {
\  'init':   'ctrlp#symfony#models#init()',
\  'accept': 'ctrlp#symfony#models#accept',
\  'lname':  'Symfony models',
\  'sname':  'sf models',
\  'type':   'path',
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
    let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:models_var)
else
    let g:ctrlp_ext_vars = [s:models_var]
endif

fun! ctrlp#symfony#models#find()
    let paths = [
        \'src/*/Entity',
        \'src/*/*/Entity',
        \'src/*/*/*/Entity',
        \'src/*/Model',
        \'src/*/*/Model',
        \'src/*/*/*/Model',
        \'src/*/Repository',
        \'src/*/*/Repository',
        \'src/*/*/*/Repository',
        \'src/*/Doctrine/ORM',
        \'src/*/*/Doctrine/ORM',
        \'src/*/*/*/Doctrine/ORM',
    \]

    return ctrlp#symfony#find(paths, '**/[^.]*.php', g:ctrlp_symfony_ignore_tests_pattern)
endf

fun! ctrlp#symfony#models#init()
    let results = ctrlp#symfony#models#find()

    return map(results, 'fnamemodify(v:val, ":s?src/??:r")')
endf

fun! ctrlp#symfony#models#accept(mode, str)
    call ctrlp#acceptfile(a:mode, printf('%s/src/%s.php', ctrlp#symfony#get_root(), a:str))
endf

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
fun! ctrlp#symfony#models#id()
    return s:id
endf
