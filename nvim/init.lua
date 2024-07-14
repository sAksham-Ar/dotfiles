vim.g.mapleader = " "
vim.cmd [[set shell=/bin/bash ]]
require('sets')

require("config.lazy")

-- extensions
vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>g', ':LazyGit<CR>', { noremap = true })

-- telescope
vim.api.nvim_set_keymap('n', '<leader>f', ':Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>s', ':Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':Telescope current_buffer_fuzzy_find<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>c', ':Telescope commands<CR>', { noremap = true })


-- Telescope git-worktree
vim.api.nvim_set_keymap('n', '<leader>wf', ':lua require(\'telescope\').extensions.git_worktree.git_worktrees()<CR>',
    { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>wc',
    ':lua require(\'telescope\').extensions.git_worktree.create_git_worktree()<CR>',
    { noremap = true })


-- movement b/w windows
vim.api.nvim_set_keymap('n', '<leader>vk', ':wincmd k<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>vj', ':wincmd j<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>vh', ':wincmd h<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>vl', ':wincmd l<CR>', { noremap = true })


-- compitest
vim.api.nvim_set_keymap('n', '<leader>cpr', ':CompetiTest receive contest<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>cpt', ':CompetiTest run<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>cpa', ':CompetiTest add_testcase<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>cpe', ':CompetiTest edit_testcase<CR>', { noremap = true })

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

-- neogen
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)

-- move line with indent
vim.api.nvim_set_keymap('n', '<leader>j', ":MoveLine(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>j', ":MoveBlock(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>k', ":MoveLine(-1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>k', ":MoveBlock(-1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', ":MoveHChar(1)<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>h', ":MoveHChar(-1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>l', ":MoveHBlock(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>h', ":MoveHBlock(-1)<CR>", { noremap = true, silent = true })


-- substitute
-- vim.keymap.set("n", "<leader>r", require('substitute').operator, { noremap = true })
vim.keymap.set("n", "<leader>rr", require('substitute').line, { noremap = true })
vim.keymap.set("n", "<leader>S", require('substitute').eol, { noremap = true })
vim.keymap.set("x", "<leader>s", require('substitute').visual, { noremap = true })

vim.keymap.set("n", "<leader>mvp", ":Gomvp<CR>", { noremap = true })

-- auto commands
local au_utils = vim.api.nvim_create_augroup("Utils", { clear = true })

-- trim trailing whitespace
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     pattern = "*",
--     command = "%s/\\s\\+$//e",
--     group = au_utils
-- })

local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimports()
  end,
  group = format_sync_grp,
})

-- for switching between projects
vim.api.nvim_set_keymap('n', '<c-f>', ':silent !tmux neww tmux-sessionizer<CR>', { noremap = true })
