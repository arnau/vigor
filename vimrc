set nocompatible

":let mapleader=","
":let mapleader="\\"
:imap jj <Esc>

set ruler
set paste
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set backspace=indent,eol,start   " Allow backspacing over everything in insert mode

" No backup
set nobackup
set nowritebackup
"set backup                       " keep a backup file
"set backupdir=~/.vimbackup,/tmp  " backup files directories
"set directory=~/.vimbackup,/tmp  " swap files directories
"set history=50                   " keep 50 lines of command line history

" Tab completion options
set wildmode=list:longest,list:full
set complete=.,w,t
set wildmenu
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,test/fixtures/*,vendor/gems/*

set showcmd " display incomplete commands

"statusline setup
set statusline=%f                         "tail of the filename
set statusline+=%y                        "filetype
set statusline+=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}
set statusline+=%{fugitive#statusline()}
set statusline+=%m                        "modified flag
set statusline+=%=                        "left/right separator
set statusline+=%c,                       "cursor column
set statusline+=%l/%L                     "cursor line/total lines
set statusline+=\ %P                      "percent through file
set laststatus=2

set linespace=1

set guifont=Menlo:h12
set t_Co=256
set background=dark
"colorscheme xoria256
colorscheme teaspoon

" Display extra whitespace
set list listchars=tab:›\ ,trail:\ ,eol:¬

" Command-T configuration
let g:CommandTMaxHeight=20

" Keep visual mode after indenting
vmap < <gv
vmap > >gv

" shift+arrow-keys to select text
set keymodel=startsel

" Show the next match while entering a search
set incsearch

"Highlighting search matches
set hlsearch

" MacVIM shift+arrow-keys behavior (required in .vimrc)
""let macvim_hig_shift_movement = 1
" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Hitting F5 will clean out all trailing whitespace or tabs
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

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
else
  set autoindent " always set autoindenting on
endif " has("autocmd")

"Pathogen plugin
filetype off " Needed so pathogen also loads ftdetect plugins.
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Re-enable per filetype plugins and indents after loading pathogen plugin
filetype plugin indent on

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

augroup filetypedetect
  " RDF Notation 3 Syntax
  au BufNewFile,BufRead *.n3,*.ttl  setfiletype n3
  let g:NERDCustomDelimiters = {
    \ 'n3': { 'left': '# ' }
  \ }
augroup END


