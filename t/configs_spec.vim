describe 'CtrlPSymfonyConfigs'

    before
        let g:ctrlp_builtins = ''
        let g:ctrlp_ext_vars = []
        let &runtimepath=getcwd()
        runtime plugin/ctrlp-symfony.vim
        cd t/fixtures
    end

    after
        cd -
    end

    it 'finds the Symfony config files'
        Expect ctrlp#symfony#configs#find() == [
            \'app/config/routing.yml',
            \'src/AppBundle/Resources/config/routing.yml',
            \'src/AppBundle/Resources/config/services.yml',
            \'src/RandomVendor/Bundle/RandomBundle/Resources/config/doctrine/Order.orm.yml',
            \'src/RandomVendor/Bundle/RandomBundle/Resources/config/services.xml',
        \]
    end

end
