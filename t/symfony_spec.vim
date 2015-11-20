describe 'CtrlP Symfony helpers'

    before
        let g:ctrlp_builtins = ''
        let g:ctrlp_ext_vars = []
        cd t/fixtures
    end

    after
        cd -
    end

    it 'finds the Symfony directory root'
        Expect ctrlp#symfony#get_root() == "."
    end

end
