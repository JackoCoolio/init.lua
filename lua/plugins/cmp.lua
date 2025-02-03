return {
	"saghen/blink.cmp",

	-- dependencies = "rafamadriz/friendly-snippets",

	build = "nix run .#build-plugin",

	opts = {
		keymap = {
			-- disable 'default' preset
			preset = "none",

			["<CR>"] = { "accept", "fallback" },
			["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },

			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<Down>"] = { "select_next", "snippet_forward", "fallback" },

			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			["<Up>"] = { "select_prev", "snippet_backward", "fallback" },
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
			},
		},

		completion = {
			list = {
				selection = {
					preselect = false,
					auto_insert = false,
				},
			},
			ghost_text = {
				enabled = false,
			},
			menu = {
				draw = {
					treesitter = { "lsp" },
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 100,
			},
		},
	},

	opts_extend = { "sources.default" },
}
