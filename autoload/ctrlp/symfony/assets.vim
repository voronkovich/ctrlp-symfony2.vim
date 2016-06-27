if exists('g:loaded_ctrlp_symfony_assets') && g:loaded_ctrlp_symfony_assets
    finish
endif
let g:loaded_ctrlp_symfony_assets = 1

let s:assets_var = {
\  'init':   'ctrlp#symfony#assets#init()',
\  'accept': 'ctrlp#symfony#assets#accept',
\  'lname':  'Symfony assets',
\  'sname':  'sf assets',
\  'type':   'path',
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
    let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:assets_var)
else
    let g:ctrlp_ext_vars = [s:assets_var]
endif

fun! ctrlp#symfony#assets#find()
    let paths = [
        \'app/Resources/public',
        \'app/Resources/assets',
        \'src/*/Resources/public',
        \'src/*/*/Resources/public',
        \'src/*/*/*/Resources/public',
        \'src/*/Resources/assets',
        \'src/*/*/Resources/assets',
        \'src/*/*/*/Resources/assets',
    \]

    return symfony#find(paths, '**/[^.]*.*', '\.\(png\|\jpg\|jpeg\|gif\)$')
endf

fun! ctrlp#symfony#assets#init()
    let results = ctrlp#symfony#assets#find()

    return map(results, 'fnamemodify(v:val, ":s?src/??:s?app/Resources/??")')
endf

fun! ctrlp#symfony#assets#accept(mode, str)
    let root = symfony#get_root()

    if filereadable(printf('%s/app/Resources/%s', root, a:str))
        call ctrlp#acceptfile(a:mode, printf('%s/app/Resources/%s', root, a:str))
    else
        call ctrlp#acceptfile(a:mode, printf('%s/src/%s', root, a:str))
    endif
endf

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
fun! ctrlp#symfony#assets#id()
    return s:id
endf
