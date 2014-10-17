if exists('g:loaded_ctrlp_symfony2_controllers') && g:loaded_ctrlp_symfony2_controllers
  finish
endif
let g:loaded_ctrlp_symfony2_controllers = 1

let s:controllers_var = {
\  'init':   'ctrlp#symfony2#controllers#init()',
\  'accept': 'ctrlp#symfony2#controllers#accept',
\  'lname':  'Symfony2 controllers',
\  'sname':  'sf2 contro',
\  'type':   'path',
\}

let s:finder = "find src/ -path '*/Controller/*' ! -path '*/Tests/*' -type f ! -name '.*' -prune | sed 's_src/__'"

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:controllers_var)
else
  let g:ctrlp_ext_vars = [s:controllers_var]
endif

function! ctrlp#symfony2#controllers#init()
  return split(system(s:finder), "\n")
endfunction

function! ctrlp#symfony2#controllers#accept(mode, str)
  call ctrlp#acceptfile(a:mode, 'src/' . a:str)
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#symfony2#controllers#id()
  return s:id
endfunction
