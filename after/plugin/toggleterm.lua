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

local zsh = Terminal:new {
    direction = "vertical",
    size = 40,
}

local function zsh_toggle()
    zsh:toggle()
end

vim.keymap.set("n", "<leader>G", lazygit_toggle, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>z", zsh_toggle, { noremap = true, silent = true })
