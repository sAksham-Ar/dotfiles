call plug#begin()
Plug 'windwp/nvim-autopairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'rebelot/kanagawa.nvim'
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lualine/lualine.nvim'
"Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'onsails/lspkind.nvim'
Plug 'kdheepak/lazygit.nvim'
Plug 'kevinhwang91/promise-async'
Plug 'kevinhwang91/nvim-ufo'
Plug 'mbbill/undotree'
Plug 'MunifTanjim/nui.nvim'        " it's a dependency
Plug 'xeluxee/competitest.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'mfussenegger/nvim-lint'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'simrat39/rust-tools.nvim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'williamboman/nvim-lsp-installer'
Plug 'ThePrimeagen/harpoon'
Plug 'ThePrimeagen/git-worktree.nvim'
"Plug 'rafamadriz/friendly-snippets'
" main one
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
call plug#end()

let mapleader = " "
nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>g :LazyGit<CR>
nnoremap <leader>f :Telescope find_files<CR>
nnoremap <leader>s :Telescope live_grep<CR>
nnoremap <leader>p <cmd>lua vim.lsp.buf.formatting()<CR>
vnoremap <leader>p <cmd>lua vim.lsp.buf.range_formatting()<CR>
nnoremap <leader>ha :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>hn :lua require("harpoon.ui").nav_next()<CR>
nnoremap <leader>hp :lua require("harpoon.ui").nav_prev()<CR>
nnoremap <leader>hj :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>hk :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>hl :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>h; :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>hf :Telescope harpoon marks<CR>
nnoremap <leader>wf :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>wc :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>


nmap <silent> <leader>vk :wincmd k<CR>
nmap <silent> <leader>vj :wincmd j<CR>
nmap <silent> <leader>vh :wincmd h<CR>
nmap <silent> <leader>vl :wincmd l<CR>

augroup INLAY_HINTS
    autocmd!
    " autocmd BufWritePre *.lua Neoformat
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END
