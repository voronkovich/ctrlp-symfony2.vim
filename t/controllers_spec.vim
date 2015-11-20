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
            \'src/MyBundle/Controller/Admin/UserController.php',
            \'src/MyBundle/Controller/PostController.php',
            \'src/MyBundle/Controller/SecurityController.php',
        \]
    end

end
