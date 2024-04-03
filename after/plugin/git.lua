local diffview = require("diffview")
local diff_actions = require("diffview.actions")

diffview.setup {
    hg_cmd = nil,
}

-- mappings

vim.keymap.set("n", "<leader>gs", "<cmd>G<cr>") -- git status
vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>") -- git diff
