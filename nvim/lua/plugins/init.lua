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
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }


    -- db
    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-ui'
    use 'kristijanhusak/vim-dadbod-completion'

    use { 'thibthib18/mongo-nvim', rocks = { 'lua-mongo' } }

    -- utils
    use {
        "windwp/nvim-autopairs",
    }
    use 'mbbill/undotree'
    use 'ThePrimeagen/harpoon'
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
    use "lukas-reineke/indent-blankline.nvim"
    use({
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
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
    use 'simrat39/symbols-outline.nvim'
    use 'p00f/clangd_extensions.nvim'
    use { 'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require("null-ls").setup({
                sources = {
                    require("null-ls").builtins.formatting.black,
                },
            })
        end,
    }
    use {
        "smjonas/inc-rename.nvim",
        config = function()
            require("inc_rename").setup()
        end,
    }
    use 'jose-elias-alvarez/typescript.nvim'
    -- Debug adapter protocol
    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"
    use "theHamsta/nvim-dap-virtual-text"
    use "nvim-telescope/telescope-dap.nvim"

    use 'leoluz/nvim-dap-go'

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
    use {
        'lukas-reineke/headlines.nvim',
        config = function()
            require('headlines').setup()
        end,
    }

    -- comments
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                mappings = {
                    basic = true,
                    extra = true,
                    extended = true
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
        requires = 'MunifTanjim/nui.nvim',
    }
    -- use { 'glepnir/template.nvim' }

    -- status bar
    use {
        'nvim-lualine/lualine.nvim',
    }

end)
