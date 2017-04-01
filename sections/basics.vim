let g:maplocalleader = ","

" Colors and Fonts
" set t_Co=256
set termguicolors
" set background=dark
" colorscheme stonespoon
" colorscheme zazen
colorscheme tenderspoon
" colorscheme tender

" colorscheme onedark
" let g:onedark_termcolors=256

set number
set relativenumber
set cursorline
set visualbell t_vb=
set paste
set encoding=utf-8
scriptencoding utf-8
set smartindent
set colorcolumn=80
set textwidth=78

" Display incomplete commands
set showcmd
set ignorecase
set smartcase

set ttyfast

set mouse=a
set ttymouse=xterm

" Whitespaces {{{
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set linespace=1

" Display extra whitespace
set list listchars=tab:→\ ,trail:\ ,eol:¬
set showbreak=··

" Tab completion
set wildmode=list:longest,list:full
" set complete=.,w,t
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,*.jpg,*.png,*.ttf,*.doc,*.pdf,*.gif,*.gz,vendor/gems/*,*/tmp/*,.so,*.swp,*.zip
set omnifunc=on
set completeopt=menu,preview


" Backup
set nobackup
set nowritebackup
"set noswapfile

set directory=/tmp



" Search

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set nohlsearch
endif

" fixes crazy regex style to what I expect to be
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v


" Mappings {{{
noremap <Leader>fm gqap

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

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" switch off F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap <Leader>gg :GitGutter<CR>
" }}}
