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
Plug 'tomasr/molokai'
Plug 'zaki/zazen'
Plug 'KeitaNakamura/neodark.vim'
Plug 'jacoborus/tender.vim'
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
" }}}

call plug#end()

" Sections {{{
source ~/.vim/sections/basics.vim
source ~/.vim/sections/gitgutter.vim
source ~/.vim/sections/airline.vim
source ~/.vim/sections/fzf.vim
source ~/.vim/sections/ale.vim
" }}}

" Signature {{{
let g:SignatureMarkTextHLDynamic = 1
let g:SignatureMarkerTextHLDynamic = 1
" }}}

" " ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
" let s:opam_share_dir = system("opam config var share")
" let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

" let s:opam_configuration = {}

" function! OpamConfOcpIndent()
"   execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
" endfunction
" let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

" function! OpamConfOcpIndex()
"   execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
" endfunction
" let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

" function! OpamConfMerlin()
"   let l:dir = s:opam_share_dir . "/merlin/vim"
"   execute "set rtp+=" . l:dir
" endfunction
" let s:opam_configuration['merlin'] = function('OpamConfMerlin')

" let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
" let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
" let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
" for tool in s:opam_packages
"   " Respect package order (merlin should be after ocp-index)
"   if count(s:opam_available_tools, tool) > 0
"     call s:opam_configuration[tool]()
"   endif
" endfor
" " ## end of OPAM user-setup addition for vim / base ## keep this line
" " ## added by OPAM user-setup for vim / ocp-indent ## a0682c34b6fac18537020f73480c375e ## you can edit, but keep this line
" if count(s:opam_available_tools,"ocp-indent") == 0
"   source s:opam_share_dir . "/vim/syntax/ocp-indent.vim"
" endif
" " ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
" " let g:syntastic_ocaml_checkers = ['merlin']
" nnoremap <LocalLeader>t :MerlinTypeOf
" " ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
" " XXX: https://github.com/realworldocaml/book/wiki/Installation-Instructions
" " To indent, just == or select =
" " <localleader> t: Type def
" " <localleader> n/p: mark
" " gd: goto definition
