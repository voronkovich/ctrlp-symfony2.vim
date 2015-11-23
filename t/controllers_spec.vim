describe 'CtrlPSymfonyControllers'

    before
        let g:ctrlp_builtins = ''
        let g:ctrlp_ext_vars = []
        runtime plugin/ctrlp-symfony.vim
        cd t/fixtures
    end

    after
        cd -
    end

    it 'finds the Symfony controllers'
        Expect ctrlp#symfony#controllers#find() == [
            \'src/AppBundle/Controller/Admin/UserController.php',
            \'src/AppBundle/Controller/PostController.php',
            \'src/AppBundle/Controller/SecurityController.php',
            \'src/Acme/DemoBundle/Controller/HelloController.php',
            \'src/RandomVendor/Bundle/RandomBundle/Controller/Admin/OrderController.php',
            \'src/RandomVendor/Bundle/RandomBundle/Controller/HomepageController.php',
        \]
    end

end
