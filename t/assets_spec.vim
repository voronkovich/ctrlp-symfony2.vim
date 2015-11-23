describe 'CtrlPSymfonyAssets'

    before
        let g:ctrlp_builtins = ''
        let g:ctrlp_ext_vars = []
        runtime plugin/ctrlp-symfony.vim
        cd t/fixtures
    end

    after
        cd -
    end

    it 'finds the Symfony assets'
        Expect ctrlp#symfony#assets#find() == [
            \'app/Resources/public/js/main.js',
            \'src/AppBundle/Resources/public/css/styles.css',
            \'src/AppBundle/Resources/public/js/app.js',
            \'src/RandomVendor/Bundle/RandomBundle/Resources/public/js/order.js',
            \'src/RandomVendor/Bundle/RandomBundle/Resources/public/scss/main.scss',
        \]
    end

end
