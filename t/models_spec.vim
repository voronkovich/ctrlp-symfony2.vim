describe 'CtrlPSymfonyModels'

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

    it 'finds the Symfony models (Doctrine/Propel)'
        Expect ctrlp#symfony#models#find() == [
            \'src/AppBundle/Entity/User.php',
            \'src/Acme/DemoBundle/Entity/Demo.php',
            \'src/AppBundle/Model/Product.php',
            \'src/RandomVendor/Bundle/RandomBundle/Doctrine/ORM/OrderRepository.php',
        \]
    end

end
