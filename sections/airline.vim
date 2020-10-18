let g:airline_theme = 'distinguished'
" let g:airline_theme = 'lucius'
" let g:airline_theme = 'ravenpower'

let g:airline_detect_paste = 0
let g:airline_detect_modified = 1
let g:airline_powerline_fonts = 0
let g:airline_skip_empty_sections = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

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
let g:airline_exclude_preview = 0

let g:airline#extensions#syntastic#enabled = 1

let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 0
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']

let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#trailing_format = 't %s'
let g:airline#extensions#whitespace#mixed_indent_format = 'm %s'

let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#tabline#enabled = 1

" let g:airline#extensions#tabline#current_first = 0
let g:airline#extensions#tabline#buffer_min_count = 100
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#close_symbol = ''
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#tab_min_count = 100
let g:airline#extensions#tabline#tabs_label = ''
