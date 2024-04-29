local telescope = require("telescope")
local fb_actions = require("telescope._extensions.file_browser.actions")
local builtin = require("telescope.builtin")
local util = require("jackocoolio.util")

require("telescope").setup {
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
        file_browser = {
            theme = "ivy",
            dir_icon = "",
            grouped = true,
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    -- your custom insert mode mappings
                },
                ["n"] = {
                    -- your custom normal mode mappings
                    ["a"] = fb_actions.create,
                },
            },
        },
    },
}

telescope.load_extension("fzf")
telescope.load_extension("file_browser")

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>pg", function()
    local search = vim.fn.input("grep: ")
    builtin.grep_string({ search = search })
end, opts)

vim.keymap.set("n", "<leader>pd", builtin.lsp_workspace_symbols, opts)

vim.keymap.set("n", "<leader>e", telescope.extensions.file_browser.file_browser, opts)
