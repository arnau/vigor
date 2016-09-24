" Filetypes {{{
if has("autocmd")
  augroup vimrc
    autocmd!

    " Save and load folds
    autocmd BufWinLeave * silent! mkview
    autocmd BufWinEnter * silent! loadview

  augroup END

  augroup filetypedetect
    " Treat RDF/XML files like XML
    autocmd BufNewFile,BufRead *.{rdf,rdfs,owl} set ft=xml
    " Reformat XML
    " TODO: verify what happen when a non-UTF-8 XML is saved after xmllint
    " au FileType xml exe \":silent 1,$!xmllint --format --encode UTF-8 --recover - 2>/dev/null"
    let g:xml_syntax_folding = 1
    " TODO: use a remap
    "set foldmethod=syntax

    function s:setupWrapping()
      set wrap
      set wrapmargin=2
      set textwidth=72
    endfunction

    autocmd BufNewFile,BufRead *.n3,*.ttl,*.trig setfiletype n3
    autocmd BufNewFile,BufRead *.rq,*.sparql setfiletype sparql
    autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

    autocmd FileType dockerfile set commentstring=#\ %s
    autocmd FileType n3 set commentstring=#\ %s
    autocmd FileType sparql set commentstring=#\ %s

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78
  augroup END

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif
" }}}
