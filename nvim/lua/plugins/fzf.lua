return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup({})

        vim.api.nvim_set_keymap('n', '<leader>f', ':FzfLua files<CR>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<leader>s', ':FzfLua grep_project<CR>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<leader>b', ':FzfLua grep_current<CR>', { noremap = true })
    end
}
