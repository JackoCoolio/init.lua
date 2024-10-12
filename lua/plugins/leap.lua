return {
	"ggandor/leap.nvim",

	dependencies = { "tpope/vim-repeat" },

	-- leap is already lazy
	lazy = false,

	config = function()
		require("leap").create_default_mappings()
	end,
}
