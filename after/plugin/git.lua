-- diffview

local diffview = require("diffview")
local diff_actions = require("diffview.actions")

diffview.setup {
    hg_cmd = nil,
}

-- diffview mappings

vim.keymap.set("n", "<leader>gs", "<cmd>G<cr>") -- git status
vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>") -- git diff

-- gitsigns

local should_enable_blame = function(bufnr)
    local max_filesize = 100 * 1024 -- 100 KB
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
    if ok and stats and stats.size > max_filesize then
        return false
    end

    return true
end

local gitsigns = require("gitsigns")
gitsigns.setup {
    on_attach = function(bufnr)
        require("gitsigns.actions").toggle_current_line_blame(should_enable_blame(bufnr))
    end,
}
