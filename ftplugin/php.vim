set tabstop=4
set shiftwidth=4
set softtabstop=4

nnoremap ge :%!php<cr>
vnoremap ge :!php<cr>

" reload the repl
let @r="mzGo
nnoremap gr @r