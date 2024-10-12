return {
	"stevearc/oil.nvim",

	keys = {
		{ "<leader>e", "<cmd>Oil<cr>", desc = "Open file browser" },
	},

	-- can't lazy load without `default_file_explorer` being ignored
	lazy = false,

	opts = {
		default_file_explorer = true,
		columns = {
			"icon",
		},
		buf_options = {
			buflisted = false,
			bufhidden = "hide",
		},
		win_options = {
			wrap = false,
			signcolumn = "no",
			cursorcolumn = false,
			foldcolumn = "0",
			spell = false,
			list = false,
			conceallevel = 3,
			concealcursor = "nvic",
		},
		-- use_default_keymaps = false,
	},

	cmd = "Oil",
	ft = "netrw",
}
