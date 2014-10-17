if exists('g:loaded_ctrlp_symfony2_views') && g:loaded_ctrlp_symfony2_views
  finish
endif
let g:loaded_ctrlp_symfony2_views = 1

let s:views_var = {
\  'init':   'ctrlp#symfony2#views#init()',
\  'accept': 'ctrlp#symfony2#views#accept',
\  'lname':  'Symfony2 views',
\  'sname':  'sf2 views',
\  'type':   'path',
\}

let s:finder = "find src/ -path '*/Resources/views/*' -type f ! -name '.*' -prune | sed 's_src/__'; find app/Resources/views -type f ! -name '.*' -prune "

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:views_var)
else
  let g:ctrlp_ext_vars = [s:views_var]
endif

function! ctrlp#symfony2#views#init()
  return split(system(s:finder), "\n")
endfunc

function! ctrlp#symfony2#views#accept(mode, str)
 if (stridx(a:str, 'app/Resources/views') == 0)
     call ctrlp#acceptfile(a:mode, a:str)
 else
     call ctrlp#acceptfile(a:mode, 'src/' . a:str)
 endif
endfunc

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#symfony2#views#id()
  return s:id
endfunction
