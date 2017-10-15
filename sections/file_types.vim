" OCaml
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
" set rtp+=/usr/local/share/ocamlmerlin/vim
let g:syntastic_ocaml_checkers = ['merlin']
nnoremap <LocalLeader>t :MerlinTypeOf


augroup vimrc
  autocmd!

  " Save and load folds
  autocmd BufWinLeave * silent! mkview
  autocmd BufWinEnter * silent! loadview
  autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetypedetect
  autocmd!
  autocmd BufNewFile,BufRead *.{rdf,rdfs,owl} setfiletype xml
  autocmd BufNewFile,BufRead *.{n3,ttl,trig} setfiletype n3
  autocmd BufNewFile,BufRead *.{rq,sparql} setfiletype sparql
  autocmd BufNewFile,BufRead *.{md,markdown,mdown,mkd,mkdn,txt} setfiletype markdown
  autocmd BufNewFile,BufRead *.mk setfiletype make

  autocmd FileType dockerfile setlocal commentstring=#\ %s
  autocmd FileType n3 setlocal commentstring=#\ %s
  autocmd FileType sparql setlocal commentstring=#\ %s
  autocmd FileType nginx setlocal commentstring=#\ %s
  autocmd FileType ocaml setlocal commentstring=(*\ %s\ *)
  autocmd FileType text setlocal textwidth=78


  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
augroup END
