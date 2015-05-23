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

## Bundles


### Helpers

* http://github.com/Shougo/vimproc.git (VimL, C)
* https://github.com/Shougo/vimshell.vim.git (VimL)
* https://github.com/tpope/vim-commentary (VimL)
* https://github.com/tpope/vim-pathogen.git (VimL)
* https://github.com/tpope/vim-repeat.git (VimL)
* https://github.com/tpope/vim-surround.git (VimL)
* https://github.com/tpope/vim-tbone.git (VimL)
* https://github.com/vim-scripts/matchit.zip.git (VimL)


### Contextual helpers

* https://github.com/airblade/vim-gitgutter (VimL)
* https://github.com/bling/vim-airline (VimL)
* https://github.com/editorconfig/editorconfig-vim.git (VimL, C, Python, Ruby)


### Search

* https://github.com/kien/ctrlp.vim.git (VimL)
* https://github.com/Shougo/unite.vim.git (VimL)


### HTML

* https://github.com/vim-scripts/Emmet.vim


### Ruby

* https://github.com/tpope/vim-rake (VimL)
* https://github.com/tpope/vim-projectionist (VimL)


### Syntaxes

* [CSS](http://www.w3.org/TR/CSS/) : https://github.com/lepture/vim-css
* [CoffeeScript](http://coffeescript.org/) : https://github.com/kchmck/vim-coffee-script.git
* [Docker](https://www.docker.com/) https://github.com/honza/dockerfile.vim
* [Erlang](http://www.erlang.org/) : https://github.com/oscarh/vimerl.git
* [Go](https://golang.org/) : https://github.com/jnwhiteh/vim-golang
* [Handlebars](http://handlebarsjs.com/) : https://github.com/mustache/vim-mustache-handlebars
* [JSON](http://json.org/) : https://github.com/vim-scripts/JSON.vim
* [Javascript](https://en.wikipedia.org/wiki/JavaScript/) : https://github.com/pangloss/vim-javascript.git
* [Puppet](https://puppetlabs.com/) : https://github.com/puppetlabs/puppet-syntax-vim
* [R](http://www.r-project.org/) : https://github.com/vim-scripts/Vim-R-plugin.git
* [SPARQL](http://www.w3.org/TR/sparql11-query/) : https://github.com/arnau/sparql.vim.git
* [Stylus](http://learnboost.github.com/stylus/) : https://github.com/wavded/vim-stylus
* [n3](http://www.w3.org/TeamSubmission/n3/) : https://github.com/vim-scripts/n3.vim.git


### Color schemes

* https://github.com/arnau/teaspoon.vim


## Snippets

* Reformat JSON

        :%!python -m json.tool


## Some anti-patterns

http://rbtnn.hateblo.jp/entry/2014/12/28/010913


## Credits

Arnau Siches under MIT License.
