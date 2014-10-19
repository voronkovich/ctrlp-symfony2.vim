if exists('g:loaded_ctrlp_symfony2_assets') && g:loaded_ctrlp_symfony2_assets
    finish
endif
let g:loaded_ctrlp_symfony2_assets = 1

let s:assets_var = {
\  'init':   'ctrlp#symfony2#assets#init()',
\  'accept': 'ctrlp#symfony2#assets#accept',
\  'lname':  'Symfony2 assets',
\  'sname':  'sf2 assets',
\  'type':   'path',
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
    let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:assets_var)
else
    let g:ctrlp_ext_vars = [s:assets_var]
endif

let s:find = "cd %s; find src/ -path '*/Resources/public/*' -type f ! -name '.*' -prune | sed 's_src/__'"

fun! ctrlp#symfony2#assets#init()
  return ctrlp#symfony2#helpers#find(s:find)
endf

fun! ctrlp#symfony2#assets#accept(mode, str)
    call ctrlp#acceptfile(a:mode, ctrlp#symfony2#helpers#symfony2_root() . '/src/' . a:str)
endf

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
fun! ctrlp#symfony2#assets#id()
    return s:id
endf
