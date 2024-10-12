return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		vim.g.mapleader = " "

		require("which-key").add({
			-- move visual lines
			{ "J", ":m '>+1<CR>gv=gv", mode = "v", desc = "Move the selection down" },
			{ "K", ":m '<-2<CR>gv=gv", mode = "v", desc = "Move the selection up" },

			{
				mode = "n",
				hidden = true,

				-- keep cursor in the same spot when pressing J
				{ "J", "mzJ`z" },
				-- keep cursor centered while moving up and down
				{ "<C-d>", "<C-d>zz" },
				{ "<C-u>", "<C-u>zz" },
				-- keep cursor centered when jumping in search
				{ "n", "nzzzv" },
				{ "N", "Nzzzv" },
				-- bad times ahead if press Q
				{ "Q", "<nop>" },
			},

			-- delete to void register
			{ mode = { "n", "v" }, "<leader>d", [["_d]] },
		})
	end,
}
