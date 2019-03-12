set path+=$PWD/**
set number
set splitbelow
set splitright

source ~/.dotfiles/sensible.vim

augroup CursorLine
	au!
	au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	au WinLeave * setlocal nocursorline
augroup END

hi CursorLine term=bold cterm=bold ctermbg=8
