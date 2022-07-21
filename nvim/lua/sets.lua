vim.opt.relativenumber = true

-- dont closed changed buffers when quitind
vim.opt.hidden = true

-- fix tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true


vim.opt.nu = true

-- live search
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50

-- fixing file already being folded
vim.opt.foldlevel = 99

-- integrating with os clipboard
vim.opt.clipboard = "unnamedplus"

-- dont add new line at eof
vim.cmd [[ set nofixendofline ]]

-- dont highlight after search
vim.cmd [[ set nohlsearch ]]

vim.cmd [[ set noerrorbells ]]
vim.cmd [[ set nowrap ]]

-- for undo tree
vim.opt.undofile = true
vim.cmd [[ set noswapfile ]]
vim.cmd [[ set nobackup ]]
vim.cmd [[ set undodir=~/.vim/undodir]]

-- for completion in commands
vim.cmd [[ set completeopt=menu,menuone,noselect ]]

-- enable cursor
vim.cmd [[set mouse=a]]
