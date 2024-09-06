return {
    "raddari/last-color.nvim",

    lazy = false,

    config = function()
        local theme = require("last-color").recall() or "default"
        vim.cmd.colorscheme(theme)
    end,
}
