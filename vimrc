set nocompatible

call plug#begin('~/.vim/plugged')

" Helpers {{{
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'Shougo/vimproc.vim', { 'do': 'make' } | Plug 'Shougo/vimshell.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-easy-align'
Plug 'w0rp/ale'
Plug 'rmolin88/vim-pomodoro'
" }}}

" Context {{{
Plug 'airblade/vim-gitgutter'
Plug 'kshenoy/vim-signature'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim'
Plug 'ap/vim-css-color'
Plug 'metakirby5/codi.vim'
Plug 'tpope/vim-db'
" }}}

" Colorschemes {{{
Plug 'arnau/teaspoon.vim'
Plug 'zaki/zazen'
Plug 'KeitaNakamura/neodark.vim'
Plug 'jacoborus/tender.vim'
Plug 'jordwalke/flatlandia'
" }}}

" Languages {{{
"Plug 'vim-scripts/Emmet.vim'

Plug 'idris-hackers/idris-vim', { 'for': 'idris' }
Plug 'elmcast/elm-vim', { 'for': 'elm' }
let g:elm_setup_keybindings = 0
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['rust', 'elm']

function! BuildComposer(info)
  if a:info.status !=# 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

Plug 'junegunn/goyo.vim', { 'for': 'markdown' }

Plug 'chrisbra/csv.vim', { 'for': 'csv' }

Plug 'fatih/vim-go', { 'for': 'go' }

Plug 'docker/docker' , { 'for': 'docker', 'rtp': '/contrib/syntax/vim' }

Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

Plug 'flowtype/vim-flow', { 'for': 'javascript' }

Plug 'cespare/vim-toml'

Plug 'vim-scripts/n3.vim'

Plug 'moskytw/nginx-contrib-vim'

Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer'

Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }

" Plug 'the-lambda-church/merlin', { 'rtp': '/vim/merlin' }
" Plug 'ocaml/merlin', { 'rtp': '/vim/merlin' }
Plug 'reasonml-editor/vim-reason-plus'

Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }

Plug 'lifepillar/pgsql.vim'

Plug 'pest-parser/pest.vim'

Plug 'arnau/vim-abnf-utf8'
" }}}

call plug#end()

" Sections {{{
source ~/.vim/sections/basics.vim
source ~/.vim/sections/gitgutter.vim
source ~/.vim/sections/airline.vim
source ~/.vim/sections/fzf.vim
source ~/.vim/sections/ocaml.vim
source ~/.vim/sections/ale.vim
" }}}

" Signature {{{
let g:SignatureMarkTextHLDynamic = 1
let g:SignatureMarkerTextHLDynamic = 1
" }}}
