return {
	"nvim-neorg/neorg",

	-- documentation says it shouldn't be lazy-loaded
	lazy = false,

	opts = {
		load = {
			["core.defaults"] = {},
			["core.concealer"] = {},
			["core.dirman"] = {
				config = {
					workspaces = {
						notes = "~/notes",
					},
					default_workspace = "notes",
				},
			},
			-- update once blink is supported
			-- ["core.completion"] = {
			-- 	config = {
			-- 		name = "[Neorg]",
			-- 		engine = "nvim-cmp",
			-- 	},
			-- },
		},
	},

	config = function(_, opts)
		require("neorg").setup(opts)

		vim.wo.foldlevel = 99
		vim.wo.conceallevel = 2
	end,
}
