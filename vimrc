set nocompatible

" Pathogen {{{

runtime bundle/vim-pathogen/autoload/pathogen.vim
filetype off " Needed so pathogen also loads ftdetect plugins.
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" }}}

set number
set cursorline
set visualbell t_vb=
set ruler
set paste
set encoding=utf-8
set autoindent " always set autoindenting on

" Display incomplete commands
set showcmd
set ignorecase
set smartcase

set ttyfast

""some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm

" Whitespaces {{{

set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set backspace=indent,eol,start   " Allow backspacing over everything in insert mode
set linespace=1
" Display extra whitespace
set list listchars=tab:›\ ,trail:\ ,eol:¬

" Tab completion {{{

set wildmode=list:longest,list:full
set complete=.,w,t
set wildmenu
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,*.jpg,*.png,*.svg,*.ttf,*.doc,*.pdf,*.gif,*.gz,vendor/gems/*

" }}}

" }}}

" Backup {{{

set nobackup
set nowritebackup
"set noswapfile

" Backup files directories
"set backupdir=~/.vimbackup,/tmp
" Swap files directories
set directory=~/.vimbackup,/tmp
" Keep 50 lines of command line history
set history=50

" Save and load folds
autocmd BufWinLeave * silent! mkview
autocmd BufWinEnter * silent! loadview

" }}}

" Colors and Fonts {{{

set guifont=Menlo:h12
set t_Co=256
set background=dark
colorscheme teaspoon

" }}}

"Statusline {{{

" Tail of the filename
set statusline=%f
" Filetype
set statusline+=%y
" Encoding
set statusline+=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}
" Git branch
set statusline+=%{fugitive#statusline()}
" Modified flag
set statusline+=%m
" Left/right separator
set statusline+=%=
" Cursor column
set statusline+=%c,
" Cursor line/total lines
set statusline+=%l/%L
" Percent through file
set statusline+=\ %P
set laststatus=2

" }}}

" Search {{{

set incsearch
set hlsearch

" }}}

" Mappings {{{

:imap jj <Esc>

" Keep visual mode after indenting
vmap < <gv
vmap > >gv

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>vs :vs <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>sp :sp <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>te
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>


" Hitting F5 will clean out all trailing whitespace or tabs
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" }}}

" Filetypes {{{

if has("autocmd")
  augroup filetypedetect
    " RDF Notation 3 Syntax
    au BufNewFile,BufRead *.n3,*.ttl,*.trig  setfiletype n3
    au BufNewFile,BufRead *.rq,*.sparql  setfiletype sparql
    let g:NERDCustomDelimiters = {
      \ 'n3': { 'left': '# ' },
      \ 'ttl': { 'left': '# ' },
      \ 'sparql': { 'left': '# ' }
    \ }
  augroup END

  " Make sure all markdown files have the correct filetype set and setup wrapping
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript

  function s:setupWrapping()
    set wrap
    set wrapmargin=2
    set textwidth=72
  endfunction

  " Treat RDF/XML files like XML
  au BufNewFile,BufRead *.{rdf,rdfs,owl} set ft=xml
  " Reformat XML
  " TODO: verify what happen when a non-UTF-8 XML is saved after xmllint
  " au FileType xml exe \":silent 1,$!xmllint --format --encode UTF-8 --recover - 2>/dev/null"
  let g:xml_syntax_folding = 1
  " TODO: use a remap
  "set foldmethod=syntax

endif

" }}}

" ZenCoding {{{
let g:user_zen_expandabbr_key = '<C-z>'
let g:user_zen_complete_tag = 1
let g:user_zen_settings = {
\  'indentation' : '  '
\}
" }}}
" Command-T {{{

let g:CommandTMaxHeight=20

" }}}

" R {{{

let vimrplugin_screenvsplit = 1
let ScreenImpl = 'Tmux'

" }}}

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set nohlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif " has("autocmd")

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

