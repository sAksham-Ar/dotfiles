call plug#begin()
" color themes
Plug 'marko-cerovac/material.nvim'

" essential
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" file browser
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'

" utils
Plug 'windwp/nvim-autopairs'
Plug 'mbbill/undotree'
Plug 'ThePrimeagen/harpoon'

Plug 'kevinhwang91/promise-async'
Plug 'kevinhwang91/nvim-ufo'

"lsp stuff
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'williamboman/nvim-lsp-installer'
Plug 'onsails/lspkind.nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'simrat39/rust-tools.nvim'
Plug 'mfussenegger/nvim-lint'

"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" autocomplete
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/vim-vsnip'
"Plug 'rafamadriz/friendly-snippets'


Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" git
Plug 'kdheepak/lazygit.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'ThePrimeagen/git-worktree.nvim'

" cp
Plug 'MunifTanjim/nui.nvim'        " it's a dependency
Plug 'xeluxee/competitest.nvim'

" status bar
Plug 'nvim-lualine/lualine.nvim'
call plug#end()

let mapleader = " "
nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>g :LazyGit<CR>
nnoremap <leader>f :Telescope find_files<CR>
nnoremap <leader>s :Telescope live_grep<CR>
nnoremap <leader>b :Telescope current_buffer_fuzzy_find<CR>
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
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END
