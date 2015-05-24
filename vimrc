set nocompatible

let g:maplocalleader = ","

" Pathogen {{{
runtime bundle/vim-pathogen/autoload/pathogen.vim
filetype off " Needed so pathogen also loads ftdetect plugins.
call pathogen#infect('bundle/{}')
call pathogen#helptags()
" }}}

set number
set cursorline
set visualbell t_vb=
set ruler
set paste
set encoding=utf-8
scriptencoding utf-8
set autoindent " always set autoindenting on
set autoread " update a open file edited outside of Vim
set ttimeoutlen=50
set colorcolumn=80

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
set list listchars=tab:→\ ,trail:\ ,eol:¬

" Tab completion {{{
set wildmode=list:longest,list:full
set complete=.,w,t
set wildmenu
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,*.jpg,*.png,*.ttf,*.doc,*.pdf,*.gif,*.gz,vendor/gems/*,*/tmp/*,.so,*.swp,*.zip
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
" }}}

" Colors and Fonts {{{

set guifont=Menlo:h12
set t_Co=256
set background=dark
colorscheme stonespoon

" }}}

"Statusline {{{

" Tail of the filename
set statusline=%f
" Filetype
set statusline+=%y
" Encoding
set statusline+=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}
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
" fixes crazy regex style to what I expect to be
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

set incsearch
set hlsearch

" }}}

" Mappings {{{

" Keep visual mode after indenting
vnoremap < <gv
vnoremap > >gv

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
noremap <Leader>e :edit <C-R>=expand("%:p:h") . "/" <CR>
noremap <Leader>vs :vsplit <C-R>=expand("%:p:h") . "/" <CR>
noremap <Leader>sp :split <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>te
noremap <Leader>te :tabedit <C-R>=expand("%:p:h") . "/" <CR>

" Hitting F5 will clean out all trailing whitespace or tabs
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" switch off F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" }}}

" Unite
source ~/.vim/sections/unite.vim
" Airline
source ~/.vim/sections/airline.vim
" GitGutter
source ~/.vim/sections/gitgutter.vim


" Emmet {{{
let g:user_emmet_expandabbr_key = '<c-z>'
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
\  'indentation' : '  '
\}
" }}}

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set nohlsearch
endif

let g:javascript_enable_domhtmlcss = 1

" Filetypes
source ~/.vim/sections/file_types.vim
