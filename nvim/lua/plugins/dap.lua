return {
    {
        'mfussenegger/nvim-dap',
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
    },
    { 'theHamsta/nvim-dap-virtual-text' },
    { 'nvim-telescope/telescope-dap.nvim' },
    {
        'ericpubu/lsp_codelens_extensions.nvim',
        -- Only required for debugging
        dependencies = { { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" } },
        config = function()
            require("codelens_extensions").setup {
                rust_debug_adapter = "rt_lldb"
            }
        end,
    }
}
