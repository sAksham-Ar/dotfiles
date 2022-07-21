---@diagnostic disable: undefined-global
vim.g.mapleader = " "
vim.cmd [[set shell=/bin/bash ]]
require('sets')
require('plugins')

-- setting up plugins
require('plugins.cmp')
require('plugins.colors')
require('plugins.compitest')
require('plugins.git')
require('plugins.lsp')
require('plugins.lspsaga')
require('plugins.lualine')
require('plugins.rust')
require('plugins.telescope')
require('plugins.tree')
require('plugins.treesitter')
require('plugins.ufo')
require('plugins.dap')
require('plugins.refactoring')
require('plugins.db')
-- require('plugins.template')

-- for switching between projects
vim.api.nvim_set_keymap('n', '<c-f>', ':silent !tmux neww tmux-sessionizer<CR>', { noremap = true })

-- extensions
vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>g', ':LazyGit<CR>', { noremap = true })

-- telescope
vim.api.nvim_set_keymap('n', '<leader>f', ':Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>s', ':Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':Telescope current_buffer_fuzzy_find<CR>', { noremap = true1 })


-- Telescope git-worktree
vim.api.nvim_set_keymap('n', '<leader>wf', ':lua require(\'telescope\').extensions.git_worktree.git_worktrees()<CR>',
    { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>wc',
    ':lua require(\'telescope\').extensions.git_worktree.create_git_worktree()<CR>',
    { noremap = true })

-- Telescope harpoon
vim.api.nvim_set_keymap('n', '<leader>ht', ':Telescope harpoon marks<CR>', { noremap = true })

-- harpoon
vim.api.nvim_set_keymap('n', '<leader>hf', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ha', ':lua require(\'harpoon.mark\').add_file()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>hn', ':lua require(\'harpoon.ui\').nav_next()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>hp', ':lua require(\'harpoon.ui\').nav_prev()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>hj', ':lua require(\'harpoon.ui\').nav_file(1)<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>hk', ':lua require(\'harpoon.ui\').nav_file(2)<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>hl', ':lua require(\'harpoon.ui\').nav_file(3)<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>h;', ':lua require(\'harpoon.ui\').nav_file(4)<CR>', { noremap = true })

-- movement b/w windows
vim.api.nvim_set_keymap('n', '<leader>vk', ':wincmd k<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>vj', ':wincmd j<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>vh', ':wincmd h<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>vl', ':wincmd l<CR>', { noremap = true })


-- compitest
vim.api.nvim_set_keymap('n', '<leader>cpr', ':CompetiTestReceive<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>cpt', ':CompetiTestRun<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>cpa', ':CompetiTestAdd<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>cpe', ':CompetiTestEdit<CR>', { noremap = true })

-- trouble
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
    { silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>",
    { silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>",
    { silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
    { silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
    { silent = true, noremap = true }
)


-- dadbod
vim.api.nvim_set_keymap("n", "<leader>du", "<cmd>DBUIToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>da", "<cmd>DBUIAddConnection<CR>", { noremap = true })

-- treesitter
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)

-- auto commands
local au_utils = vim.api.nvim_create_augroup("Utils", { clear = true })

-- trim trailing whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = "%s/\\s\\+$//e",
    group = au_utils
})

-- for autocompiling packer
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    group = group_name,
    pattern = {
        "plugins/init.lua",
    },
    command = "source <afile> | PackerCompile",
    once = false,
})
