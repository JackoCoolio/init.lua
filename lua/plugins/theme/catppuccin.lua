return {
	"catppuccin/nvim",

	name = "catppuccin",

	priority = 1000,

	lazy = true,

	opts = {
		flavour = "mocha",
		background = {
			light = "latte",
			dark = "mocha",
		},
		transparent_background = false,
		show_end_of_buffer = true, -- show '~' after buffer
		term_colors = false,
		dim_inactive = {
			enabled = true,
			shade = "dark",
			percentage = 0.15,
		},
		no_italic = false,
		no_bold = false,
		styles = {
			comments = { "italic" },
			conditionals = { "italic" },
			loops = {},
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
		},
		color_overrides = {},
		custom_highlights = {},
		integrations = {
			cmp = true,
			gitsigns = true,
			nvimtree = true,
			telescope = true,
			notify = false,
			mini = false,
		},
	},
}
