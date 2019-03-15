set path+=$PWD/**
" Show line numbers
set number
" Split from left to right
set splitbelow
set splitright

" Show white spaces
set list

" Standard vim things
source ~/.dotfiles/sensible.vim

"Tab 4 into spaces 
set expandtab
set tabstop=4
set shiftwidth=4

" Show cursor line only in the active window
augroup CursorLine
	au!
	au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	au WinLeave * setlocal nocursorline
augroup END

" Curosr line style
hi CursorLine term=bold cterm=bold ctermbg=8

" White space style
hi SpecialKey ctermfg=red ctermbg=red

" Color theme
source ~/.dotfiles/base16-shell.vim
