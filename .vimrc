set scrolloff=8
set cursorline "highlight current line
set number "line numbering
set relativenumber
set hlsearch
set clipboard=unnamedplus

" indentation and tabs
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

" check if file has been modified outside vim
set autoread
autocmd CursorHold * call Timer()
function! Timer()
	call feedkeys("f\e")
	checktime
endfunction
set updatetime=5000  " milliseconds
autocmd FileChangedShell * echo "File changed, type :e! to reload."

" enable pathogen
execute pathogen#infect()

" solarized
syntax enable
set background=dark
" let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

" airline
let g:airline_powerline_fonts=1
set laststatus=2
let g:ctags_statusline=1
