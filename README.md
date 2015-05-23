# Vigor

Vigor is Arnau Siches' Vim Playground.

## Usage

Use the dockerized version:

    $ docker run --rm -it -v /var/foo:/var/foo -w /var/foo

First, clone the repository.

    $ git clone git://github.com/arnau/Vigor.git ~/.vim
    $ cd ~/.vim
    $ ./vigor install

If it's already installed you can update it running

    $ cd ~/.vim
    $ ./vigor update

## Some anti-patterns

http://rbtnn.hateblo.jp/entry/2014/12/28/010913

## Search

* https://github.com/kien/ctrlp.vim.git

## Bundles

* https://github.com/tpope/vim-fugitive.git
* https://github.com/vim-scripts/matchit.zip.git
* https://github.com/tsaleh/vim-align.git
* https://github.com/scrooloose/nerdcommenter.git
* https://github.com/ervandew/supertab
* https://github.com/tpope/vim-endwise
* https://github.com/Raimondi/delimitMate
* https://github.com/tpope/vim-ragtag.git
* https://github.com/tpope/vim-repeat.git
* https://github.com/tpope/vim-surround.git
* https://github.com/tpope/vim-pathogen.git
* https://github.com/tpope/vim-commentary
* https://github.com/vim-scripts/Emmet.vim
* https://github.com/vim-scripts/Screen-vim---gnu-screentmux.git
* https://github.com/tpope/vim-tbone.git
* https://github.com/editorconfig/editorconfig-vim.git
* http://github.com/Shougo/vimproc.git
* https://github.com/Shougo/vimshell.vim.git
* https://github.com/Shougo/unite.vim.git
* https://github.com/bling/vim-airline
* https://github.com/airblade/vim-gitgutter
* https://github.com/t9md/vim-ruby-xmpfilter
* https://github.com/tpope/vim-rake
* https://github.com/honza/dockerfile.vim

### Syntaxes

* [R](http://www.r-project.org/) : https://github.com/vim-scripts/Vim-R-plugin.git
* [Erlang](http://www.erlang.org/) : https://github.com/oscarh/vimerl.git
* [Go](https://golang.org/) : https://github.com/jnwhiteh/vim-golang
* [Javascript](https://en.wikipedia.org/wiki/JavaScript/) : https://github.com/pangloss/vim-javascript.git
* [CoffeeScript](http://coffeescript.org/) : https://github.com/kchmck/vim-coffee-script.git
* [n3](http://www.w3.org/TeamSubmission/n3/) : https://github.com/vim-scripts/n3.vim.git
* [SPARQL](http://www.w3.org/TR/sparql11-query/) : https://github.com/arnau/sparql.vim.git
* [Puppet](https://puppetlabs.com/) : https://github.com/puppetlabs/puppet-syntax-vim
* [JSON](http://json.org/) : https://github.com/vim-scripts/JSON.vim
* [Stylus](http://learnboost.github.com/stylus/) : https://github.com/wavded/vim-stylus
* [CSS](http://www.w3.org/TR/CSS/) : https://github.com/lepture/vim-css
* [Handlebars](http://handlebarsjs.com/) : https://github.com/mustache/vim-mustache-handlebars

### Color schemes

* https://github.com/arnau/teaspoon.vim

## Snippets

* Reformat JSON

    :%!python -m json.tool


## Credits

Arnau Siches under MIT License.

Vigor is based on Vim, Vam, Voom so thanks to Emili Pareño and his contributors.

