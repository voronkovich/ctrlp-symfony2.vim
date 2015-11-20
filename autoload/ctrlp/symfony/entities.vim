if exists('g:loaded_ctrlp_symfony_entities') && g:loaded_ctrlp_symfony_entities
    finish
endif
let g:loaded_ctrlp_symfony_entities = 1

let s:entities_var = {
\  'init':   'ctrlp#symfony#entities#init()',
\  'accept': 'ctrlp#symfony#entities#accept',
\  'lname':  'Symfony entities',
\  'sname':  'sf entities',
\  'type':   'path',
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
    let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:entities_var)
else
    let g:ctrlp_ext_vars = [s:entities_var]
endif

fun! ctrlp#symfony#entities#find()
    let paths = [
        \'src/**/Entity/**',
        \'src/**/Model/**',
    \]

    return ctrlp#symfony#find(paths, '*.php', g:ctrlp_symfony_ignore_tests_pattern)
endf

fun! ctrlp#symfony#entities#init()
    let results = ctrlp#symfony#entities#find()

    return ctrlp#symfony#substitute(results, '^src/\|\.php$', '', 'g')
endf

fun! ctrlp#symfony#entities#accept(mode, str)
    call ctrlp#acceptfile(a:mode, printf('%s/src/%s.php', ctrlp#symfony#get_root(), a:str))
endf

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
fun! ctrlp#symfony#entities#id()
    return s:id
endf
