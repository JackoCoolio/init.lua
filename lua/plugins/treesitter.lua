return {
	"nvim-treesitter/nvim-treesitter",

	-- update parsers on build
	build = ":TSUpdate",

	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			highlight = {
				enable = true,
			},
		})
	end,
}
