return {
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },
    {
        'nvimdev/lspsaga.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional
            'nvim-tree/nvim-web-devicons',     -- optional
        },
        event = 'LspAttach',
    },
    { 'onsails/lspkind.nvim' },
    {
        'mrcjkb/rustaceanvim',
        version = '^4', -- Recommended
        lazy = false,   -- This plugin is already lazy
    },
    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
        end,
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    { "folke/neodev.nvim",          opts = {} },
    { "p00f/clangd_extensions.nvim" },
    {
        'nvimtools/none-ls.nvim',
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    -- null_ls.builtins.diagnostics.revive,
                    -- null_ls.builtins.formatting.golines.with({
                    --     extra_args = {
                    --         "--max-len=180",
                    --         "--base-formatter=gofumpt",
                    --     },
                    -- }),
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.prettierd,
                    null_ls.builtins.formatting.buf,
                }
            })
        end,

    },
    {
        "smjonas/inc-rename.nvim",
        config = function()
            require("inc_rename").setup {
                input_buffer_type = "dressing",

            }
        end,
    },
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {},
    },
    {

    }
}
