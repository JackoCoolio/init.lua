return {
    "folke/trouble.nvim",

    dependencies = { "nvim-tree/nvim-web-devicons" },

    cmd = "Trouble",

    keys = {
        { "<leader>od", function() require("trouble").toggle() end },
    },

    opts = {
        multiline = true,
        auto_open = false,
        auto_close = false,
        mode = "workspace_diagnostics",
        follow = false,
    },
}
