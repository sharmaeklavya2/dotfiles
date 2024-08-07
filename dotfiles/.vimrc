set scrolloff=8  " start scrolling screen a few lines before cursor reaches end of screen
set cursorline  " highlight current line
set number  " line numbering
set relativenumber  " show relative line numbers
set wrap lbr  " soft wrap lines but don't break words
set laststatus=2  " always show status line

set ttimeoutlen=2  " don't pause on Esc key: https://www.reddit.com/r/vim/comments/86034o/_/dw1dzdu/
set hlsearch  " highlight search matches
set backspace=indent,eol,start  " make backspace key work as expected
set ignorecase
set smartcase  " but make it case sensitive if an uppercase is entered

" indentation and tabs
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

if has("syntax")
    syntax enable  " enable syntax highlighting
endif

" yank to clipboard
if has("clipboard")
    set clipboard=unnamed
    if has("unnamedplus")
        set clipboard+=unnamedplus
    endif
endif
if has("mouse")
    set mouse=nvi  " enable mouse use
endif

if has("autocmd")
    " check if file has been modified outside vim
    set autoread
    autocmd CursorHold * call Timer()
    function! Timer()
        call feedkeys("f\e")
        checktime
    endfunction
    set updatetime=5000  " milliseconds
    autocmd FileChangedShell * echo "File changed, type :e! to reload."

    " spell check
    autocmd FileType text set spell spelllang=en_us
    autocmd FileType markdown set spell spelllang=en_us
    autocmd FileType tex set spell spelllang=en_us

    " custom syntax highlighting
    autocmd BufRead,BufNewFile *.pyi set filetype=python
    autocmd BufRead,BufNewFile *.tex set filetype=tex
    autocmd BufRead,BufNewFile *.tikz set filetype=tex
    autocmd BufRead,BufNewFile *.mylog set filetype=diff
    autocmd BufRead,BufNewFile *.html.jinja2 set filetype=htmldjango
    autocmd BufRead,BufNewFile *.cleaver set filetype=markdown

    " call flake8 on saving file
    autocmd BufWritePost *.py call Flake8()
endif

filetype plugin on  " https://github.com/nvie/vim-flake8/issues/13#issuecomment-161026086

if has("eval")
    " solarized
    let g:solarized_termtrans=1  " use transparent background
    " let g:solarized_termcolors=256

    " airline
    " let g:airline_powerline_fonts=1  " use better fonts
    let g:airline_exclude_preview=1  " Make airline usable with jedi-vim

    let g:ctags_statusline=1
    let g:flake8_show_in_gutter=1

    " set background based on system theme
    function! SetBackground(channel, msg)
        let theme = trim(a:msg)
        if theme ==? "light"
            set background=light
        elseif theme==? "dark"
            set background=dark
        endif
    endfunction
    if executable("python3")
        let job = job_start(["python3", "-c", "import darkdetect; print(darkdetect.theme())"], {"out_cb": "SetBackground"})
        " https://github.com/albertosottile/darkdetect
    endif
endif

silent! colorscheme solarized

" set termguicolors
" silent! colorscheme one
