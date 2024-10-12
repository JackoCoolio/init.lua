return {
	"sindrets/diffview.nvim",

	keys = {
		{ "<leader>gd", "<cmd>DiffviewOpen<cr>" },
	},

	cmd = {
		"DiffviewOpen",
		"DiffviewClose",
		"DiffviewToggleFiles",
		"DiffviewFocusFiles",
		"DiffviewRefresh",
		"DiffviewFileHistory",
	},

	opts = {
		hg_cmd = nil,
	},
}
