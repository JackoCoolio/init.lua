local telescope = require("telescope")
local fb_actions = require("telescope._extensions.file_browser.actions")
local builtin = require("telescope.builtin")

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

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>gf", function()
    if IsGit() then
        builtin.git_files()
    else
        print("error: not a git repository")
    end
end, {})

vim.keymap.set("n", "<leader>ps", function()
    builtin.live_grep()
end, {})

vim.keymap.set("n", "<leader>pg", function()
    local search = vim.fn.input("grep: ")
    builtin.grep_string({ search = search })
end)

vim.keymap.set("n", "<leader>e", telescope.extensions.file_browser.file_browser, { noremap = true })
