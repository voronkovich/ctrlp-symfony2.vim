describe 'Symfony helpers'

    before
        let g:ctrlp_builtins = ''
        let g:ctrlp_ext_vars = []
        let &runtimepath=getcwd()
        cd t/fixtures
    end

    after
        cd -
    end

    it 'finds the Symfony directory root'
        Expect symfony#get_root() == "."
    end

end
