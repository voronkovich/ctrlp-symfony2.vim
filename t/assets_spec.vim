describe 'CtrlPSymfonyAssets'

    before
        let g:ctrlp_builtins = ''
        let g:ctrlp_ext_vars = []
        cd t/fixtures
    end

    after
        cd -
    end

    it 'finds the Symfony assets'
        Expect ctrlp#symfony#assets#find() == [
            \'app/Resources/public/js/main.js',
            \'src/MyBundle/Resources/public/css/styles.css',
            \'src/MyBundle/Resources/public/js/app.js',
        \]
    end

end
