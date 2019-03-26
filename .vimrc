set path+=$PWD/**
" Show line numbers
set number

" Always show tabline
set showtabline=2

" When split be positionned down, ( OFF )
" set splitbelow
" Split from left to right
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
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
	au WinLeave * setlocal nocursorline
	au WinLeave * setlocal nocursorcolumn
augroup END

" Cursor line style
" Commented because base16-vim provides better highlighting
" hi CursorLine term=bold cterm=bold ctermbg=18

" Color theme
source ~/.dotfiles/base16-shell.vim

" White space style
hi SpecialKey ctermfg=red

" TabLine
hi TabLineFill term=bold ctermbg=18
hi TabLineSel  term=bold ctermfg=18 ctermbg=4

" () {} [] coloring when hovering
hi MatchParen term=reverse ctermfg=18 ctermbg=14
