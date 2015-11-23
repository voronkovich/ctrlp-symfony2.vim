if exists('g:loaded_ctrlp_symfony_forms') && g:loaded_ctrlp_symfony_forms
    finish
endif
let g:loaded_ctrlp_symfony_forms = 1

let s:forms_var = {
\  'init':   'ctrlp#symfony#forms#init()',
\  'accept': 'ctrlp#symfony#forms#accept',
\  'lname':  'Symfony forms',
\  'sname':  'sf forms',
\  'type':   'path',
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
    let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:forms_var)
else
    let g:ctrlp_ext_vars = [s:forms_var]
endif

fun! ctrlp#symfony#forms#find()
    let paths = [
        \'src/*/Form',
        \'src/*/*/Form',
        \'src/*/*/*/Form',
    \]

    return ctrlp#symfony#find(paths, '**/[^.]*.php', g:ctrlp_symfony_ignore_tests_pattern)
endf

fun! ctrlp#symfony#forms#init()
    let results = ctrlp#symfony#forms#find()

    return map(results, 'fnamemodify(v:val, ":s?src/??:r")')
endf

fun! ctrlp#symfony#forms#accept(mode, str)
    call ctrlp#acceptfile(a:mode, printf('%s/src/%s.php', ctrlp#symfony#get_root(), a:str))
endf

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
fun! ctrlp#symfony#forms#id()
    return s:id
endf
