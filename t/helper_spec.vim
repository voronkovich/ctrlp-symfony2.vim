describe "CtrlP Symfony 2 plugin helper"

  before
    let g:ctrlp_builtins = ''
    let g:ctrlp_ext_vars = []
    cd t/fixtures
  end

  after
    cd -
  end

  it "finds Symfony directory root"
    Expect ctrlp#symfony2#helpers#symfony2_root() == "."
  end

end
