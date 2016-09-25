let g:airline_theme = 'tomorrow'

let g:airline_detect_paste = 0
let g:airline_detect_modified = 1
let g:airline_powerline_fonts = 0
let g:airline_skip_empty_sections = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.branch = 'b'
let g:airline_symbols.linenr = ''

let g:airline_section_c = '%f'

let g:airline#extensions#syntastic#enabled = 1

let g:airline#extensions#hunks#enabled = 0

let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#trailing_format = 't %s'
let g:airline#extensions#whitespace#mixed_indent_format = 'm %s'

let g:airline#extensions#bufferline#enabled = 0

let g:airline#extensions#tmuxline#enabled = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_min_count = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#close_symbol = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
