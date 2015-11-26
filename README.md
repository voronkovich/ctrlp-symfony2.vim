# ctrlp-symfony2.vim [![Build Status](https://travis-ci.org/voronkovich/ctrlp-symfony2.vim.svg?branch=master)](https://travis-ci.org/voronkovich/ctrlp-symfony2.vim)

This is a [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim) plugin that allows you to open your [Symfony 2 & 3](http://symfony.com/) app files easily. For now, this plugin provides:

* `:CtrlPSymfonyModels` list all project models (entities) and theirs repositories
* `:CtrlPSymfonyControllers` list all project controllers
* `:CtrlPSymfonyViews` list all project views
* `:CtrlPSymfonyAssets` list all project assets files
* `:CtrlPSymfonyConfigs` list all project config files
* `:CtrlPSymfonyForms` list all project form types, extensions and etc.

## Installation

### Using [pathogen](https://github.com/tpope/vim-pathogen)

``` sh
git clone git://github.com/voronkovich/ctrlp-symfony2.vim ~/.vim/bundle/ctrlp-symfony2.vim
```

### Using [vundle](https://github.com/gmarik/vundle)

Add to vimrc:

``` vim
Plugin 'voronkovich/ctrlp-symfony2.vim'
```

### Running tests

Tests are run using a Ruby test runner, so you'll have to have Ruby installed, then run

```sh
$ bundle install
```

Now you can run tests with

```sh
$ vim-flavor test t/
```

## License

Copyright (c) Voronkovich Oleg.  Distributed under the same terms as Vim itself.
See `:help license`.
