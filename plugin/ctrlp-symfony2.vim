if ! exists('g:ctrlp_custom_ignore')
    let g:ctrlp_custom_ignore = { 'dir': '\v[\/](app[\/]cache|vendor[\/]composer|web[\/]bundles)$' }
endif

command! CtrlPSymfony2Entities call ctrlp#init(ctrlp#symfony2#entities#id())
command! CtrlPSymfony2Controllers call ctrlp#init(ctrlp#symfony2#controllers#id())
command! CtrlPSymfony2Views call ctrlp#init(ctrlp#symfony2#views#id())
command! CtrlPSymfony2Assets call ctrlp#init(ctrlp#symfony2#assets#id())
command! CtrlPSymfony2Configs call ctrlp#init(ctrlp#symfony2#configs#id())
command! CtrlPSymfony2Sources call ctrlp#init(ctrlp#symfony2#sources#id())
