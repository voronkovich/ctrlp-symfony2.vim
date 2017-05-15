if exists('g:loaded_ctrlp_symfony_listeners') && g:loaded_ctrlp_symfony_listeners
    finish
endif
let g:loaded_ctrlp_symfony_listeners = 1

let s:listeners_var = {
\  'init':   'ctrlp#symfony#listeners#init()',
\  'accept': 'ctrlp#symfony#listeners#accept',
\  'lname':  'Symfony listeners',
\  'sname':  'sf listeners',
\  'type':   'path',
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
    let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:listeners_var)
else
    let g:ctrlp_ext_vars = [s:listeners_var]
endif

fun! ctrlp#symfony#listeners#find()
    let paths = [
        \'src/*/EventListener',
        \'src/*/*/EventListener',
        \'src/*/*/*/EventListener',
    \]

    return symfony#find(paths, '**/[^.]*.php', g:ctrlp_symfony_ignore_tests_pattern)
endf

fun! ctrlp#symfony#listeners#init()
    let results = ctrlp#symfony#listeners#find()

    return map(results, 'fnamemodify(v:val, ":s?src/??:r")')
endf

fun! ctrlp#symfony#listeners#accept(mode, str)
    call ctrlp#acceptfile(a:mode, printf('%s/src/%s.php', symfony#get_root(), a:str))
endf

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
fun! ctrlp#symfony#listeners#id()
    return s:id
endf
