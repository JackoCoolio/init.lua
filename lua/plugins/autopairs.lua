return {
    "echasnovski/mini.pairs",

    event = "InsertEnter",

    opts = {
        modes = {
            insert = true,
            command = false,
            terminal = false,
        },

        mappings = {},
    },
}

-- local npairs = require("nvim-autopairs")
-- 
-- npairs.setup({
--     map_bs = false,
--     map_cr = false,
--     disable_filetype = { "TelescopePrompt", "vim" },
--     check_ts = true,
--     enable_check_bracket_line = false,
-- })
