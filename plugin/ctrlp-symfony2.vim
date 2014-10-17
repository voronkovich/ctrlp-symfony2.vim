function! s:IsSymfony2Project()
   return filereadable('app/AppKernel.php') 
endfunction

function! s:NotSymfony2Project()
    echoerr "Symfony2 project not found!"
endfunction

if s:IsSymfony2Project() 
    let g:ctrlp_custom_ignore = { 'dir': '\v[\/](app[\/]cache|vendor[\/]composer|web[\/]bundles)$' }

    command! CtrlPSymfony2Entities call ctrlp#init(ctrlp#symfony2#entities#id())
    command! CtrlPSymfony2Controllers call ctrlp#init(ctrlp#symfony2#controllers#id())
    command! CtrlPSymfony2Views call ctrlp#init(ctrlp#symfony2#views#id())
    command! CtrlPSymfony2Assets call ctrlp#init(ctrlp#symfony2#assets#id())
    command! CtrlPSymfony2Configs call ctrlp#init(ctrlp#symfony2#configs#id())
else
    command! CtrlPSymfony2Entities call s:NotSymfony2Project()
    command! CtrlPSymfony2Controllers call s:NotSymfony2Project()
    command! CtrlPSymfony2Views call s:NotSymfony2Project()
    command! CtrlPSymfony2Assets call s:NotSymfony2Project()
    command! CtrlPSymfony2Configs call s:NotSymfony2Project()
endif
