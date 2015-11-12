if exists('g:loaded_ctrlp_symfony2_helpers') && g:loaded_ctrlp_symfony2_helpers
  finish
endif
let g:loaded_ctrlp_symfony2_helpers = 1

" Returns a full absolute path to a Symfony's root directory
fun! ctrlp#symfony2#helpers#symfony2_root()
    return fnamemodify(findfile('app/AppKernel.php'), ':p:h:h')
endf

fun! ctrlp#symfony2#helpers#find(command)
    let root = ctrlp#symfony2#helpers#symfony2_root()
    if root != ''
        return split(system(printf(a:command, root)), "\n")
    else
        throw "Symfony root path not found!"
    endif
endf
