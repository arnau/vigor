set nocompatible

call plug#begin('~/.vim/plugged')

" Helpers {{{
Plug 'tpope/vim-sensible'
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'lotabout/skim.vim'

Plug 'Shougo/vimproc.vim', { 'do': 'make' } | Plug 'Shougo/vimshell.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-easy-align'
Plug 'w0rp/ale'
Plug 'mbbill/undotree'
" }}}

" Context {{{
Plug 'airblade/vim-gitgutter'
Plug 'kshenoy/vim-signature'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-db'
Plug 'easymotion/vim-easymotion'
" }}}

" Colorschemes {{{
Plug 'arnau/teaspoon.vim'
Plug 'jordwalke/flatlandia'
" }}}

" Languages {{{
"Plug 'vim-scripts/Emmet.vim'

Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['rust']

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

Plug 'cespare/vim-toml'

Plug 'vim-scripts/n3.vim'

Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer'

" Plug 'the-lambda-church/merlin', { 'rtp': '/vim/merlin' }
" Plug 'ocaml/merlin', { 'rtp': '/vim/merlin' }
Plug 'reasonml-editor/vim-reason-plus'

Plug 'pest-parser/pest.vim'

Plug 'arnau/vim-abnf-utf8'

Plug 'AndrewRadev/inline_edit.vim'
" }}}

call plug#end()

" Sections {{{
source ~/.vim/sections/basics.vim
source ~/.vim/sections/gitgutter.vim
source ~/.vim/sections/airline.vim
source ~/.vim/sections/fzf.vim
" source ~/.vim/sections/ocaml.vim
source ~/.vim/sections/ale.vim
" }}}

" Signature {{{
let g:SignatureMarkTextHLDynamic = 1
let g:SignatureMarkerTextHLDynamic = 1
" }}}

let &t_ut=''
