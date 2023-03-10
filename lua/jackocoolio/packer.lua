-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { "catppuccin/nvim", as = "catppuccin" }

    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

    use { "theprimeagen/harpoon" }

    use { "mbbill/undotree" }

    --[[
    --
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            { 'williamboman/mason.nvim' }, -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' }, -- Optional
            { 'hrsh7th/cmp-path' }, -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' }, -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' }, -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }
    --]]

    use { 'neovim/nvim-lspconfig' }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-nvim-lua" }
    use { "hrsh7th/cmp-nvim-lsp-signature-help" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-path" }
    use { "hrsh7th/cmp-cmdline" }
    use { "hrsh7th/nvim-cmp" }
    use { 'L3MON4D3/LuaSnip' }

    -- use { 'ms-jpq/coq_nvim', branch = 'coq' }
    -- use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }
    -- use { 'ms-jpq/coq.thirdparty', branch = '3p' }
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }

    use { "simrat39/rust-tools.nvim" }
    use { "mfussenegger/nvim-jdtls" }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use { "nvim-lua/lsp-status.nvim" }

    use { "windwp/nvim-autopairs" }

    use { "airblade/vim-gitgutter" }

    use { 'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = {
            { "nvim-telescope/telescope.nvim" },
            { "nvim-tree/nvim-web-devicons" }
        }
    }

    use { "ggandor/leap.nvim" }

    use { "akinsho/toggleterm.nvim" }

    use { "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" }

    use { "SmiteshP/nvim-navic", requires = "neovim/nvim-lspconfig" }
end)
