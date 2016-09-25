if has("autocmd")
  augroup vimrc
    autocmd!

    " Save and load folds
    autocmd BufWinLeave * silent! mkview
    autocmd BufWinEnter * silent! loadview

  augroup END

  augroup filetypedetect
    autocmd BufNewFile,BufRead *.{rdf,rdfs,owl} setf xml
    autocmd BufNewFile,BufRead *.{n3,ttl,trig} setf n3
    autocmd BufNewFile,BufRead *.{rq,sparql} setf sparql
    autocmd BufNewFile,BufRead *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
    autocmd BufNewFile,BufRead *.mk setf make

    autocmd FileType dockerfile setlocal commentstring=#\ %s
    autocmd FileType n3 setlocal commentstring=#\ %s
    autocmd FileType sparql setlocal commentstring=#\ %s
    autocmd FileType nginx setlocal commentstring=#\ %s
    autocmd FileType text setlocal textwidth=78


    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on
  augroup END
endif
