local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    { "nvim-telescope/telescope.nvim", tag = "0.1.5", dependencies = { "nvim-lua/plenary.nvim" } },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { "nvim-telescope/telescope-file-browser.nvim", dependencies = { { "nvim-telescope/telescope.nvim" }, { "nvim-tree/nvim-web-devicons" } } },

    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "theprimeagen/harpoon", dependencies = { "nvim-lua/plenary.nvim" }, branch = "harpoon2" },
    { "mbbill/undotree" },
    { 'neovim/nvim-lspconfig' },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/nvim-cmp" },
    { 'L3MON4D3/LuaSnip' },
    -- { "williamboman/mason.nvim" },
    -- { "williamboman/mason-lspconfig.nvim" },
    { "simrat39/rust-tools.nvim" },
    -- { "mfussenegger/nvim-jdtls" },

    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
    { "nvim-lua/lsp-status.nvim" },

    { "windwp/nvim-autopairs", event = "InsertEnter", config = true },
    { "airblade/vim-gitgutter" },
    { "ggandor/leap.nvim" },
    -- { "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" } },
    -- { "SmiteshP/nvim-navic", dependencies = { "neovim/nvim-lspconfig" } },
    -- { "nvim-neorg/neorg", build = ":Neorg sync-parsers" },

    { "NoahTheDuke/vim-just", ft = { "just" }},
}

local opts = {
    install = {
        -- try to load catppuccin before running :Lazy on startup
        colorscheme = { "catppuccin" },
    },
    checker = {
        enabled = true,
        notify = true,
        frequency = 60,
    },
}

require("jackocoolio")

require("lazy").setup(plugins, opts)
