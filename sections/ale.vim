filetype off
let &runtimepath.=',~/.vim/plugged/ale'
filetype plugin on
silent! helptags ALL
" let g:ale_sign_column_always = 1
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
" %{ALEGetStatusLine()}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
" let g:ale_open_list = 1
" Pick and choose linters
let g:ale_linters = {
\   'elixir': ['credo'],
\   'javascript': ['eslint'],
\   'rust': ['cargo'],
\   'swift': ['swiftlint'],
\   'python': ['flake8', 'pylint'],
\   'text': [],
\   'vim': [],
\   'ocaml': [],
\}
