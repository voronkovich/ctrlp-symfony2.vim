if exists('g:loaded_ctrlp_symfony2_entities') && g:loaded_ctrlp_symfony2_entities
  finish
endif
let g:loaded_ctrlp_symfony2_entities = 1

let s:models_var = {
\  'init':   'ctrlp#symfony2#entities#init()',
\  'accept': 'ctrlp#symfony2#entities#accept',
\  'lname':  'Symfony2 entities',
\  'sname':  'sf2 entities',
\  'type':   'path',
\}

let s:finder = "find src/ \\( -path '*/Entity/*' -or -path '*/Resources/config/doctrine/*' \\) -! -path '*/Tests/*' -type f ! -name '.*' -prune | sed 's_src/__'"

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:models_var)
else
  let g:ctrlp_ext_vars = [s:models_var]
endif

function! ctrlp#symfony2#entities#init()
  return split(system(s:finder), "\n")
endfunc

function! ctrlp#symfony2#entities#accept(mode, str)
  call ctrlp#acceptfile(a:mode, 'src/' . a:str)
endfunc

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#symfony2#entities#id()
  return s:id
endfunction
