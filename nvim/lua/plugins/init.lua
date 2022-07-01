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

    -- utils
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use 'mbbill/undotree'
    use 'ThePrimeagen/harpoon'
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

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

    -- lint
    use 'mfussenegger/nvim-lint'

    -- autocomplete
    use {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
    }

    use {
        'ms-jpq/coq_nvim',
        branch = "coq"
    }

    -- snippets
    use {
        'hrsh7th/vim-vsnip',
        'hrsh7th/cmp-vsnip'
    }

    use {
        'ms-jpq/coq.artifacts',
        branch = "artifacts"
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

    -- status bar
    use {
        'nvim-lualine/lualine.nvim',
    }

end)
