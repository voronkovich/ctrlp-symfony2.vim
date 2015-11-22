describe 'CtrlPSymfonyViews'

    before
        let g:ctrlp_builtins = ''
        let g:ctrlp_ext_vars = []
        cd t/fixtures
    end

    after
        cd -
    end

    it 'finds the Symfony views'
        Expect ctrlp#symfony#views#find() == [
            \'app/Resources/views/base.html.twig',
            \'app/Resources/TwigBundle/views/Exception/error.html.twig',
            \'src/MyBundle/Resources/views/product.html.twig'
        \]
    end

end
