return {
	"RRethy/vim-illuminate",

	event = "BufEnter",

	config = function()
		require("illuminate").configure({
			providers = {
				"lsp",
				"treesitter",
				"regex",
			},
			delay = 100,
			filetypes_denylist = {
				"fugitive",
				"oil",
			},
			modes_denylist = { "i" },
		})
	end,
}
