---@diagnostic disable: undefined-global
return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

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
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            {
                -- only needed if you want to use the commands with "_with_window_picker" suffix
                's1n7ax/nvim-window-picker',
                tag = "v1.*",
                config = function()
                    require 'window-picker'.setup({
                        autoselect_one = true,
                        include_current = false,
                        filter_rules = {
                            -- filter using buffer options
                            bo = {
                                -- if the file type is one of following, the window will be ignored
                                filetype = { 'neo-tree', "neo-tree-popup", "notify", "quickfix" },

                                -- if the buffer type is one of following, the window will be ignored
                                buftype = { 'terminal' },
                            },
                        },
                        other_win_hl_color = '#e35e4f',
                    })
                end,
            }
        },
    }

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

    -- lsp stuff
    use {
        "williamboman/nvim-lsp-installer",
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

    -- lint
    use 'mfussenegger/nvim-lint'

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
    use { 'glepnir/template.nvim' }

    -- status bar
    use {
        'nvim-lualine/lualine.nvim',
    }

end)
