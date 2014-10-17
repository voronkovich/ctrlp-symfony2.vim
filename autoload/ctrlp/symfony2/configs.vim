if exists('g:loaded_ctrlp_symfony2_configs') && g:loaded_ctrlp_symfony2_configs
  finish
endif
let g:loaded_ctrlp_symfony2_configs = 1

let s:configs_var = {
\  'init':   'ctrlp#symfony2#configs#init()',
\  'accept': 'ctrlp#symfony2#configs#accept',
\  'lname':  'Symfony2 configs',
\  'sname':  'sf2 configs',
\  'type':   'path',
\}

let s:finder = "find src/ -path '*/Resources/config/*' -type f ! \\( -name '.*' -or -name '*.orm.*' \\) -prune | sed 's_src/__'; find app/config -type f ! -name '.*' -prune"

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:configs_var)
else
  let g:ctrlp_ext_vars = [s:configs_var]
endif

function! ctrlp#symfony2#configs#init()
  return split(system(s:finder), "\n")
endfunc

function! ctrlp#symfony2#configs#accept(mode, str)
 if (stridx(a:str, 'app/config') == 0)
     call ctrlp#acceptfile(a:mode, a:str)
 else
     call ctrlp#acceptfile(a:mode, 'src/' . a:str)
 endif
endfunc

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#symfony2#configs#id()
  return s:id
endfunction
