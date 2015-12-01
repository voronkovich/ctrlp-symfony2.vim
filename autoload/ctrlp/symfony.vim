if exists('g:loaded_ctrlp_symfony') && g:loaded_ctrlp_symfony
    finish
endif
let g:loaded_ctrlp_symfony = 1

" Returns a relative path to a Symfony project's root directory
fun! ctrlp#symfony#get_root()
    return fnamemodify(findfile('app/AppKernel.php', '.;'), ':h:h')
endf

fun! ctrlp#symfony#find(paths, pattern, ...)
    let cwd = getcwd()
    execute ':cd ' . ctrlp#symfony#get_root()

    try
        let results = s:globpath(join(a:paths, ','), a:pattern)

        if (a:0 > 0)
            let results = filter(results, printf("v:val !~ '%s'", a:1))
        endif
    finally
        execute ':cd ' . cwd
    endtry

    return results
endf

if v:version > 704 || (v:version == 704 && has('patch279'))
    fun! s:globpath(path, pattern) abort
        return globpath(a:path, a:pattern, 1, 1)
    endf
else
    fun! s:globpath(path, pattern) abort
        return split(globpath(a:path, a:pattern, 1), '\n')
    endf
endif
