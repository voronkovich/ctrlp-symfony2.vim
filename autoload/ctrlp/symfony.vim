if exists('g:loaded_ctrlp_symfony') && g:loaded_ctrlp_symfony
    finish
endif
let g:loaded_ctrlp_symfony = 1

" Returns a relative path to a Symfony project's root directory
fun! ctrlp#symfony#get_root()
    return fnamemodify(findfile('app/AppKernel.php', '.;'), ':h:h')
endf

" Runs a Symfony console command and returns a result
fun! ctrlp#symfony#console(cmd)
    let root = ctrlp#symfony#get_root()
    let output = system(printf('php %s/app/console %s', root, a:cmd))

    return v:shell_error ? 0 : output
endf

fun! ctrlp#symfony#get_services(...)
    let services = {}

    if get(a:, 1, 0)
        let results = split(ctrlp#symfony#console('debug:container --no-ansi --show-private'), '\n')
    else
        let results = split(ctrlp#symfony#console('debug:container --no-ansi'), '\n')
    endif
    " Remove the first and the last elements
    call remove(results, 0, 2)
    call remove(results, -1)

    for item in results
        let row = split(item)
        if len(row) >= 2
            if row[1] == 'alias'
                let services[row[0]] = '@' . substitute(row[3], '"', '', 'g')
            else
                let services[row[0]] = row[1]
            endif
        endif
    endfor

    return services
endf

fun! ctrlp#symfony#get_service_class(id, services)
    let class = get(a:services, a:id, 0)

    if (class && class =~ '^@')
        let class = ctrlp#symfony#get_service_class(strpart(class, 1), a:services)
    endif

    return class
endf

fun! ctrlp#symfony#composer_find_file(name)
    let autoload_file = findfile('vendor/autoload.php', '.;')

    if autoload_file == ''
        throw 'File vendor/autoload.php not found!'
    endif

    let code = printf('$c = require "%s"; echo $c->findFile($argv[1]);', autoload_file)
    let output = system(printf("php -r %s %s", shellescape(code), shellescape(a:name)))

    return v:shell_error ? 0 : output
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
