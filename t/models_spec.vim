describe 'CtrlPSymfonyModels'

    before
        let g:ctrlp_builtins = ''
        let g:ctrlp_ext_vars = []
        runtime plugin/ctrlp-symfony.vim
        cd t/fixtures
    end

    after
        cd -
    end

    it 'finds the Symfony models (Doctrine/Propel)'
        Expect ctrlp#symfony#models#find() == [
            \'src/MyBundle/Entity/User.php',
            \'src/MyBundle/Model/Product.php',
        \]
    end

end
