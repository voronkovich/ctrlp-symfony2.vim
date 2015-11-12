describe "CtrlPSymfony2Configs"

  before
    let g:ctrlp_builtins = ''
    let g:ctrlp_ext_vars = []
    cd t/fixtures
  end

  after
    cd -
  end

  it "finds the Symfony config files"
    Expect ctrlp#symfony2#configs#init() == [
      \"/MyBundle/Resources/config/routing.yml",
      \"/MyBundle/Resources/config/services/service.yml"
      \]
  end

end
