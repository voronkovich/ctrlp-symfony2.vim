fun! ctrlp#symfony2#helpers#symfony2_root()
   let root = findfile('app/AppKernel.php', '.;') 
   if root != ''
       let root = fnamemodify(root, ':h')
   endif
   retu root
endf
