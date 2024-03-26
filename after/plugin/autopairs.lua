local npairs = require("nvim-autopairs")

npairs.setup({
    map_bs = false,
    map_cr = false,
    disable_filetype = { "TelescopePrompt", "vim" },
    check_ts = true,
    enable_check_bracket_line = false,
})

-- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
-- local cmp = require("cmp")
-- cmp.event:on(
--     "confirm_done",
--     cmp_autopairs.on_confirm_done()
-- )
