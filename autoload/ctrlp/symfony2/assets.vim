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

let s:finder = "find src/ -path '*/Resources/public/*' -type f ! -name '.*' -prune | sed 's_src/__'"

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:assets_var)
else
  let g:ctrlp_ext_vars = [s:assets_var]
endif

function! ctrlp#symfony2#assets#init()
  return split(system(s:finder), "\n")
endfunc

function! ctrlp#symfony2#assets#accept(mode, str)
  call ctrlp#acceptfile(a:mode, 'src/' . a:str)
endfunc

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#symfony2#assets#id()
  return s:id
endfunction
