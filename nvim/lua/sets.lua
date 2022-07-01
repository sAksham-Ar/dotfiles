vim.opt.relativenumber = true
vim.opt.hidden = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.nu = true
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.foldlevel = 99
vim.opt.completeopt = {"menu","menuone","noselect"}
vim.opt.clipboard = "unnamedplus"

vim.cmd [[ set nofixendofline ]]
vim.cmd [[ set nohlsearch ]]
vim.cmd [[ set noerrorbells ]]
vim.cmd [[ set nowrap ]]
vim.cmd [[ set noswapfile ]]
vim.cmd [[ set nobackup ]]
vim.cmd [[ set undodir=~/.vim/undodir]]
