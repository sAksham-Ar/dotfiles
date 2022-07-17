local cmp = require 'cmp'
local lspkind = require('lspkind')

local luasnip = require 'luasnip'
local npairs = require('nvim-autopairs')

local source_mapping = {
    buffer = "[Buffer]",
    fuzzy_buffer = "[FBuffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    cmp_tabnine = "[TN]",
    fuzzy_path = "[FPath]",
}
npairs.setup {
    check_ts = true
}

local compare = require('cmp.config.compare')
cmp.setup({
    sorting = {
        priority_weight = 2,
        comparators = {
            require('cmp_tabnine.compare'),
            require('cmp_fuzzy_buffer.compare'),
            compare.offset,
            compare.exact,
            compare.score,
            compare.recently_used,
            compare.kind,
            compare.sort_text,
            compare.length,
            compare.order,
        },
    },
})

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            local menu = source_mapping[entry.source.name]
            if entry.source.name == "cmp_tabnine" then
                if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                    menu = entry.completion_item.data.detail .. " " .. menu
                end
                vim_item.kind = ""
            end
            vim_item.menu = menu
            return vim_item
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                feedkey("<Plug>luasnip-expand-or-jump", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                feedkey("<cmd>lua require'luasnip'.jump(-1)<CR>", "")
            else
                fallback()
            end
        end, { "i", "s" })
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp_signature_help' },
        { name = 'cmp_tabnine' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        {
            name = 'fuzzy_buffer',
            option = {
                max_buffer_lines = 150000,
                max_matches = 10
            }
        },
    }),
    experimental = {
        ghost_text = true
    }
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'fuzzy_buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        {
            name = 'fuzzy_buffer',
            option = {
                max_buffer_lines = 150000,
                max_matches = 10
            }
        },
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'fuzzy_path' }
    }, {
        { name = 'cmdline' }
    })
})

require("luasnip.loaders.from_vscode").lazy_load()

local tabnine = require("cmp_tabnine.config")
tabnine:setup({
    max_lines = 1000,
    max_num_results = 20,
    sort = true,
    run_on_every_keystroke = true,
    snippet_placeholder = "..",
})
