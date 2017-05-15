if ! exists('g:ctrlp_custom_ignore')
    let g:ctrlp_custom_ignore = { 'dir': '\v[\/](app[\/]cache|vendor[\/]composer|web[\/]bundles)$' }
endif

let s:ignore_tests_dirs = [ '\(T\|t\)ests\?', '\(S\|s\)pecs\?' ]

let g:ctrlp_symfony_ignore_tests_pattern = printf('\(\\\|/\)%s\(\\\|/\)', join(s:ignore_tests_dirs, '\|'))

command! CtrlPSymfonyEntities call ctrlp#init(ctrlp#symfony#models#id())
command! CtrlPSymfonyControllers call ctrlp#init(ctrlp#symfony#controllers#id())
command! CtrlPSymfonyViews call ctrlp#init(ctrlp#symfony#views#id())
command! CtrlPSymfonyAssets call ctrlp#init(ctrlp#symfony#assets#id())
command! CtrlPSymfonyConfigs call ctrlp#init(ctrlp#symfony#configs#id())
command! CtrlPSymfonyForms call ctrlp#init(ctrlp#symfony#forms#id())
command! CtrlPSymfonyListeners call ctrlp#init(ctrlp#symfony#listeners#id())
command! CtrlPSymfonyServices call ctrlp#init(ctrlp#symfony#services#id())
command! CtrlPSymfonyServiceDefinition call ctrlp#init(ctrlp#symfony#show_service#id())

command! CtrlPSymfony2Entities call ctrlp#init(ctrlp#symfony#models#id())
command! CtrlPSymfony2Controllers call ctrlp#init(ctrlp#symfony#controllers#id())
command! CtrlPSymfony2Views call ctrlp#init(ctrlp#symfony#views#id())
command! CtrlPSymfony2Assets call ctrlp#init(ctrlp#symfony#assets#id())
command! CtrlPSymfony2Configs call ctrlp#init(ctrlp#symfony#configs#id())
