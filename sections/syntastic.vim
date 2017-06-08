let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0



" Rust
set hidden
let g:racer_cmd = $RUST_PATH . "/racer"
let g:rustfmt_autosave = 1


" Python
let g:syntastic_python_python_exec = '/usr/local/bin/python3'
" let g:syntastic_python_checkers = ['pylint']


" Elm
" " let g:elm_format_autosave = 1
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1

" let g:elm_syntastic_show_warnings = 1
" let g:elm_setup_keybindings = 0


" Javascript
let g:javascript_enable_domhtmlcss = 1


" Swift
let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']
