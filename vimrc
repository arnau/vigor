set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

" Helpers {{{
Plug 'Shougo/vimproc.vim', { 'do': 'make' } | Plug 'Shougo/vimshell.vim'
Plug 'Shougo/unite.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
" }}}

" Context {{{
Plug 'airblade/vim-gitgutter' | Plug 'kshenoy/vim-signature'
Plug 'bling/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
Plug 'kien/rainbow_parentheses.vim'
" }}}

" Colorschemes {{{
Plug 'junegunn/limelight.vim'
Plug 'arnau/teaspoon.vim'
Plug 'arnau/stonespoon.vim'
Plug 'chriskempson/tomorrow-theme', { 'rtp': '/vim'}
Plug 'joshdick/onedark.vim'
Plug 'gosukiwi/vim-atom-dark'
" }}}

" Languages {{{
"Plug 'vim-scripts/Emmet.vim'

Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
autocmd! User goyo.vim echom 'Goyo is now loaded!'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

Plug 'chrisbra/csv.vim', { 'for': 'csv' }

Plug 'JulesWang/css.vim'

Plug 'fatih/vim-go'

Plug 'docker/docker' , { 'rtp': '/contrib/syntax/vim' }

Plug 'pangloss/vim-javascript'

Plug 'arnau/vim-rlang'

Plug 'arnau/sparql.vim'

Plug 'cespare/vim-toml'

Plug 'vim-scripts/n3.vim'

Plug 'moskytw/nginx-contrib-vim'

Plug 'JuliaLang/julia-vim'

Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" Plug 'elmcast/elm-vim'
Plug 'lambdatoast/elm.vim'

Plug 'elixir-lang/vim-elixir'

Plug 'the-lambda-church/merlin', { 'rtp': '/vim/merlin' }

Plug 'keith/swift.vim', { 'for': 'swift' }

Plug 'raichoo/purescript-vim'
" }}}

call plug#end()


source ~/.vim/sections/basics.vim
source ~/.vim/sections/file_types.vim
source ~/.vim/sections/gitgutter.vim
source ~/.vim/sections/limelight.vim
source ~/.vim/sections/airline.vim
source ~/.vim/sections/unite.vim


" Signature {{{
let g:SignatureMarkTextHLDynamic = 1
let g:SignatureMarkerTextHLDynamic = 1
" }}}
