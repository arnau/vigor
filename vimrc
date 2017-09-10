set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Helpers {{{
Plug 'Shougo/vimproc.vim', { 'do': 'make' } | Plug 'Shougo/vimshell.vim'
" Plug 'Shougo/unite.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-easy-align'
Plug 'w0rp/ale'
" }}}


" Context {{{
Plug 'airblade/vim-gitgutter' | Plug 'kshenoy/vim-signature'
Plug 'bling/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['rust', 'elm']
Plug 'ap/vim-css-color'
" }}}

" Colorschemes {{{
Plug 'junegunn/limelight.vim'
Plug 'arnau/teaspoon.vim'
Plug 'arnau/stonespoon.vim'
Plug 'chriskempson/tomorrow-theme', { 'rtp': '/vim'}
Plug 'joshdick/onedark.vim'
Plug 'gosukiwi/vim-atom-dark'
Plug 'tomasr/molokai'
Plug 'vim-scripts/Wombat'
Plug 'zaki/zazen'
Plug 'kamwitsta/mythos'
Plug 'KeitaNakamura/neodark.vim'
Plug 'xero/blaquemagick.vim'
Plug 'jacoborus/tender.vim'
Plug 'zanglg/nova.vim'
" }}}

" Languages {{{
"Plug 'vim-scripts/Emmet.vim'

Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  set nocursorline
  set listchars=
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  set cursorline
  set listchars=tab:→\ ,trail:\ ,eol:¬
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

Plug 'chrisbra/csv.vim', { 'for': 'csv' }

Plug 'fatih/vim-go'

Plug 'docker/docker' , { 'rtp': '/contrib/syntax/vim' }

Plug 'pangloss/vim-javascript'

Plug 'flowtype/vim-flow'

Plug 'arnau/sparql.vim'

Plug 'cespare/vim-toml'

Plug 'vim-scripts/n3.vim'

Plug 'moskytw/nginx-contrib-vim'

Plug 'JuliaLang/julia-vim'

Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

Plug 'elmcast/elm-vim'
" Plug 'lambdatoast/elm.vim'

Plug 'elixir-lang/vim-elixir'

" Plug 'the-lambda-church/merlin', { 'rtp': '/vim/merlin' }
" Plug 'ocaml/merlin', { 'rtp': '/vim/merlin' }
Plug 'reasonml/vim-reason'

Plug 'raichoo/purescript-vim'

Plug 'Quramy/tsuquyomi'
" }}}

call plug#end()

" set termguicolors
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum

source ~/.vim/sections/basics.vim
source ~/.vim/sections/gitgutter.vim
source ~/.vim/sections/limelight.vim
source ~/.vim/sections/airline.vim
source ~/.vim/sections/fzf.vim
source ~/.vim/sections/ale.vim


" Signature {{{
let g:SignatureMarkTextHLDynamic = 1
let g:SignatureMarkerTextHLDynamic = 1
" }}}

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## a0682c34b6fac18537020f73480c375e ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source s:opam_share_dir . "/vim/syntax/ocp-indent.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
" let g:syntastic_ocaml_checkers = ['merlin']
nnoremap <LocalLeader>t :MerlinTypeOf
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
" XXX: https://github.com/realworldocaml/book/wiki/Installation-Instructions
" To indent, just == or select =
" <localleader> t: Type def
" <localleader> n/p: mark
" gd: goto definition
