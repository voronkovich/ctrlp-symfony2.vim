describe 'CtrlPSymfonyForms'

    before
        let g:ctrlp_builtins = ''
        let g:ctrlp_ext_vars = []
        runtime plugin/ctrlp-symfony.vim
        cd t/fixtures
    end

    after
        cd -
    end

    it 'finds the Symfony forms'
        Expect ctrlp#symfony#forms#find() == [
            \'src/AppBundle/Form/RegistrationType.php',
            \'src/Acme/DemoBundle/Form/Type/DemoType.php',
            \'src/RandomVendor/Bundle/RandomBundle/Form/Type/PostType.php',
        \]
    end

end
