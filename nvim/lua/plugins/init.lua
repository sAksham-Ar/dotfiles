vim.fn.setenv("MACOSX_DEPLOYMENT_TARGET", "10.15")

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- per project settings
    use {
        'windwp/nvim-projectconfig',
        config = function()
            require('nvim-projectconfig').setup({
                project_dir = "~/.config/projects-config/",
            })
        end

    }

    -- color theme
    use 'marko-cerovac/material.nvim'
    use { "catppuccin/nvim", as = "catppuccin", config = function()
        require("catppuccin").setup {
            integrations = {
                neotree = true,
                treesitter_context = true,
            }
        }
    end }
    use { 'stevearc/dressing.nvim', config = function()
        require('dressing').setup()
    end }

    -- essential
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- file browser
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        config = function()
            vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

            -- If you want icons for diagnostic errors, you'll need to define them somewhere:
            vim.fn.sign_define("DiagnosticSignError",
                { text = " ", texthl = "DiagnosticSignError" })
            vim.fn.sign_define("DiagnosticSignWarn",
                { text = " ", texthl = "DiagnosticSignWarn" })
            vim.fn.sign_define("DiagnosticSignInfo",
                { text = " ", texthl = "DiagnosticSignInfo" })
            vim.fn.sign_define("DiagnosticSignHint",
                { text = "", texthl = "DiagnosticSignHint" })

            vim.cmd([[nnoremap \ :Neotree toggle<cr>]])
            require("neo-tree").setup({
                filesystem = {
                    hijack_netrw_behavior = "open_default",
                    follow_current_file = true
                },
            })
        end
    }


    -- db
    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-ui'
    use 'kristijanhusak/vim-dadbod-completion'

    -- utils
    use {
        "windwp/nvim-autopairs",
    }
    use 'mbbill/undotree'
    use 'christoomey/vim-tmux-navigator'
    use 'ThePrimeagen/harpoon'
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
    use { "lukas-reineke/indent-blankline.nvim", main="ibl", opts={}}
    use({
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use({
        "gbprod/substitute.nvim",
        config = function()
            require("substitute").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end
    })

    -- move line with indent
    use 'fedepujol/move.nvim'

    -- lsp stuff
    use {
        "williamboman/mason.nvim",
        'williamboman/mason-lspconfig.nvim',
        "neovim/nvim-lspconfig",
    }
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
    })
    use {
        'onsails/lspkind.nvim'
    }
    use 'nvim-lua/lsp_extensions.nvim'
    use 'simrat39/rust-tools.nvim'
    use {
        "folke/neodev.nvim"
    }
    use {
        'ray-x/go.nvim',
        config = function()
            require("go").setup()
        end,
    }
    use 'ray-x/guihua.lua' -- recommended if need floating window support
    use 'simrat39/symbols-outline.nvim'
    use 'p00f/clangd_extensions.nvim'
    use { 'jose-elias-alvarez/null-ls.nvim',
        config = function()
            local null_ls = require("null-ls")
            local sources = {
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
                require("typescript.extensions.null-ls.code-actions"),
            }
            -- for go.nvim
            local gotest = require("go.null_ls").gotest()
            local gotest_codeaction = require("go.null_ls").gotest_action()
            local golangci_lint = require("go.null_ls").golangci_lint()
            table.insert(sources, gotest)
            -- table.insert(sources, golangci_lint)
            table.insert(sources, gotest_codeaction)
            null_ls.setup({ sources = sources, debounce = 1000, default_timeout = 5000 })
        end,
    }
    use {
        "smjonas/inc-rename.nvim",
        config = function()
            require("inc_rename").setup {
                input_buffer_type = "dressing",

            }
        end,
    }
    use 'jose-elias-alvarez/typescript.nvim'
    use 'mfussenegger/nvim-lint'
    -- Debug adapter protocol
    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"
    use "theHamsta/nvim-dap-virtual-text"
    use "nvim-telescope/telescope-dap.nvim"


    use {
        'ericpubu/lsp_codelens_extensions.nvim',
        -- Only required for debugging
        requires = { { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" } },
        config = function()
            require("codelens_extensions").setup {
                rust_debug_adapter = "rt_lldb"
            }
        end,
    }


    -- treesitter
    use {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" }
        }
    }
    use {
        "danymat/neogen",
        config = function()
            require('neogen').setup {}
        end,
        requires = "nvim-treesitter/nvim-treesitter",
        -- Uncomment next line if you want to follow only stable versions
        -- tag = "*"
    }

    -- pretty print errors
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
            }
        end
    }

    -- markdown stuff
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- comments
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                mappings = {
                    basic = true,
                    extra = true
                }
            })
        end
    }

    -- autocomplete
    use {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lsp-signature-help'
    }
    use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
    use { 'tzachar/cmp-fuzzy-buffer', requires = { 'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim' } }
    use { 'tzachar/cmp-fuzzy-path', requires = { 'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim' } }

    -- snippets
    use {
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets'
    }

    -- git
    use 'kdheepak/lazygit.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'ThePrimeagen/git-worktree.nvim'

    -- cp
    use {
        'xeluxee/competitest.nvim',
        requires = { 'MunifTanjim/nui.nvim' },
    }
    use { 'glepnir/template.nvim' }

    -- status bar
    use {
        'nvim-lualine/lualine.nvim',
    }
end)
