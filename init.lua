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
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "theprimeagen/harpoon" },
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
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "simrat39/rust-tools.nvim" },
    { "mfussenegger/nvim-jdtls" },
    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons', optional = true } },
    { "nvim-lua/lsp-status.nvim" },
    { "cohama/lexima.vim" },
    { "airblade/vim-gitgutter" },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    { "nvim-telescope/telescope-file-browser.nvim", dependencies = { { "nvim-telescope/telescope.nvim" }, { "nvim-tree/nvim-web-devicons" } } },
    { "ggandor/leap.nvim" },
    { "akinsho/toggleterm.nvim" },
    { "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" } },
    { "SmiteshP/nvim-navic", dependencies = { "neovim/nvim-lspconfig" } },
    { "nvim-neorg/neorg", build = ":Neorg sync-parsers" },
}

local opts = {}

require("lazy").setup(plugins, opts)

require("jackocoolio")
