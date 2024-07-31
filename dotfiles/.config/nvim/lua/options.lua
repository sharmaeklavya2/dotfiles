vim.opt.scrolloff = 8  -- start scrolling screen a few lines before cursor reaches end of screen
vim.opt.cursorline = true  -- highlight current line
vim.opt.number = true -- line numbering
vim.opt.relativenumber = true -- show relative line numbers
-- vim.opt.wrap = 'lbr'  -- soft wrap lines but don't break words
vim.opt.laststatus = 2  -- always show status line

vim.opt.ttimeoutlen = 2  -- don't pause on Esc key: https://www.reddit.com/r/vim/comments/86034o/_/dw1dzdu/
vim.opt.hlsearch = true  -- highlight search matches
vim.opt.ignorecase = true
vim.opt.smartcase = true  -- but make it case sensitive if an uppercase is entered
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

-- indentation and tabs
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true

vim.opt.mouse = 'nvi'  -- enable mouse use
vim.opt.clipboard = 'unnamedplus'
