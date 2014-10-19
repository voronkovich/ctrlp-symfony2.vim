if exists('g:loaded_ctrlp_symfony2_helpers') && g:loaded_ctrlp_symfony2_helpers
  finish
endif
let g:loaded_ctrlp_symfony2_helpers = 1

let s:symfony2_root = ''

fun! ctrlp#symfony2#helpers#symfony2_root()
    if s:symfony2_root == ''
        let s:symfony2_root = findfile('app/AppKernel.php', '.;') 
        if s:symfony2_root != ''
            let s:symfony2_root = fnamemodify(s:symfony2_root, ':h:h')
        endif
    endif
    return s:symfony2_root
endf

fun! ctrlp#symfony2#helpers#find(command)
    let root = ctrlp#symfony2#helpers#symfony2_root()
    if root != ''
        return split(system(printf(a:command, root)), "\n")
    else
        throw "Symfony root path not found!"
    endif
endf
