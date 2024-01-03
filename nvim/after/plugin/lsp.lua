---@diagnostic disable: undefined-global
require("neodev").setup({
    -- add any options here, or leave empty to use the default settings
})
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'ge', vim.diagnostic.open_float, bufopts)
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, bufopts)
    vim.keymap.set('n', 'ga', require('telescope.builtin').diagnostics, bufopts)

    -- formatting
    vim.keymap.set('n', '<leader>p', function() vim.lsp.buf.format { async = true } end, bufopts)
    vim.keymap.set('v', '<leader>p', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

---- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- local coq = require('coq')
-- local capabilities = coq.lsp_ensure_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

local lspconfig = require("lspconfig")
require("mason").setup()
require("mason-lspconfig").setup()


lspconfig.util.default_config = vim.tbl_extend(
    "force",
    lspconfig.util.default_config,
    {
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities
    }
)
require('go').setup({
  -- other setups ....
  lsp_cfg = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    -- other setups
  },
})

for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
    if server == 'clangd'
    then
        require("clangd_extensions").setup {
            server = {
                on_attach = on_attach,
                flags = lsp_flags,
                capabilities = capabilities
            }
        }
    elseif server == 'tsserver'
    then
        require("typescript").setup({
            disable_commands = false, -- prevent the plugin from creating Vim commands
            debug = false,            -- enable debug logging for commands
            go_to_source_definition = {
                fallback = true,      -- fall back to standard LSP definition on failure
            },
            server = {                -- pass options to lspconfig's setup method
                on_attach = on_attach,
                flags = lsp_flags,
                capabilities = capabilities
            },
        })
    else
        lspconfig[server].setup {}
    end
end
