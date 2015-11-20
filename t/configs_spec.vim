describe 'CtrlPSymfonyConfigs'

    before
        let g:ctrlp_builtins = ''
        let g:ctrlp_ext_vars = []
        cd t/fixtures
    end

    after
        cd -
    end

    it 'finds the Symfony config files'
        Expect ctrlp#symfony#configs#find() == [
            \'app/config/routing.yml',
            \'src/MyBundle/Resources/config/routing.yml',
            \'src/MyBundle/Resources/config/services/service.yml',
        \]
    end

end
