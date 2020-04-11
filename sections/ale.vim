filetype off
let &runtimepath.=',~/.vim/plugged/ale'
filetype plugin on
silent! helptags ALL " slows down starting vim
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
let g:rust_rustfmt_executable = 'cargo fmt --'
let g:ale_reasonml_refmt_executable = 'bsrefmt'
let g:ale_fixers = {
\    'javascript': ['prettier_eslint', 'eslint'],
\    'rust': ['rustfmt'],
\    'reason': ['refmt'],
\    'python': ['isort'],
\    'ocaml': ['ocp-indent'],
\}
let g:ale_fix_on_save = 1

let g:ale_ruby_rubocop_executable = 'bundle exec rubocop'
let g:ale_python_auto_pipenv = 1
" let g:ale_python_bandit_executable = 'pipenv'
" let g:ale_python_flake8_executable = 'pipenv'

" Pick and choose linters
" \   'javascript': ['eslint', 'prettier-eslint'],
let g:ale_linters = {
\   'elixir': ['credo'],
\   'rust': ['cargo'],
\   'swift': ['swiftlint'],
\   'python': ['flake8', 'pylint'],
\   'ocaml': ['merlin'],
\   'reason': [],
\}

" Markdown
let g:markdown_composer_autostart = 0

" Racer
"
" set hidden
" let g:racer_cmd = "~/.cargo/bin/racer"
augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> <localleader>gD <Plug>(rust-doc)
    autocmd FileType rust nmap <buffer> <localleader>gd <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> <localleader>gs <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> <localleader>gt <Plug>(rust-def-tab)
augroup END
