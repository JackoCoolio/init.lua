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

vim.keymap.set("n", "<leader>pf", function()
    builtin.find_files {
        hidden = true,
        no_ignore = true,
    }
end, opts)

vim.keymap.set("n", "<leader>gf", function()
    if util.is_git() then
        builtin.git_files()
    else
        print("error: not a git repository")
    end
end, opts)

vim.keymap.set("n", "<leader>ps", function()
    builtin.live_grep()
end, opts)

vim.keymap.set("n", "<leader>pg", function()
    local search = vim.fn.input("grep: ")
    builtin.grep_string({ search = search })
end, opts)

vim.keymap.set("n", "<leader>pd", builtin.lsp_workspace_symbols, opts)

vim.keymap.set("n", "<leader>pb", builtin.buffers, opts)

vim.keymap.set("n", "<leader>e", telescope.extensions.file_browser.file_browser, opts)

vim.keymap.set("n", "<leader>ht", builtin.help_tags, opts)
