return {
	"nvim-lua/lsp-status.nvim",

	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("lsp-status").config({
			status_symbol = " ",
			indicator_ok = " ",
		})
	end,
}
