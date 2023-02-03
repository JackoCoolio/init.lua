local cwd = vim.fn.getcwd()

require("toggleterm").setup {
    shell = "tmux new -A -s __TOGGLE_TERM__" .. cwd,
    open_mapping = "<C-t>",
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    direction = "vertical"
}

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new {
    cmd = "lazygit",
    hidden = true,
    direction = "float",
}

local function lazygit_toggle()
    lazygit:toggle()
end

vim.keymap.set("n", "<leader>gs", lazygit_toggle, { noremap = true, silent = true })
