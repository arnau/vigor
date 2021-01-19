scriptencoding utf-8

function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set nocursorline
  set listchars=
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  set cursorline
  set listchars=tab:→\ ,trail:\ ,eol:¬
endfunction

augroup markdown
  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeave nested call <SID>goyo_leave()
augroup END

augroup vimrc
  autocmd!

  " Save and load folds
  " autocmd BufWinLeave * silent! mkview
  " autocmd BufWinEnter * silent! loadview
  autocmd FileType vim setlocal foldmethod=marker
augroup END

if exists('did_load_filetypes')
  finish
endif
augroup filetypedetect
  autocmd!
  autocmd BufNewFile,BufRead *.rdf setfiletype xml
  autocmd BufNewFile,BufRead *.rdfs setfiletype xml
  autocmd BufNewFile,BufRead *.owl setfiletype xml
  autocmd BufNewFile,BufRead *.n3 setfiletype n3
  autocmd BufNewFile,BufRead *.ttl setfiletype n3
  autocmd BufNewFile,BufRead *.trig setfiletype n3
  autocmd BufNewFile,BufRead *.sparql setfiletype sparql
  autocmd BufNewFile,BufRead *.rq setfiletype sparql
  autocmd BufNewFile,BufRead *.md setfiletype markdown
  autocmd BufNewFile,BufRead *.markdown setfiletype markdown
  autocmd BufNewFile,BufRead *.mk setfiletype make
  autocmd BufNewFile,BufRead justfile setf make
  autocmd BufNewFile,BufRead *.elm setfiletype elm
  autocmd BufNewFile,BufRead *.re setfiletype reason
  autocmd BufNewFile,BufRead *.rei setfiletype reason
  autocmd BufNewFile,BufRead *.csv setfiletype csv

  autocmd FileType dockerfile setlocal commentstring=#\ %s
  autocmd FileType n3 setlocal commentstring=#\ %s
  autocmd FileType sparql setlocal commentstring=#\ %s
  autocmd FileType nginx setlocal commentstring=#\ %s
  autocmd FileType ocaml setlocal commentstring=(*\ %s\ *)
  autocmd FileType text setlocal textwidth=78

"   " Enable file type detection.
"   " Use the default filetype settings, so that mail gets 'tw' set to 72,
"   " 'cindent' is on in C files, etc.
"   " Also load indent files, to automatically do language-dependent indenting.
"   filetype plugin indent on
augroup END
