local wk = require("which-key")

-- leader mappings
wk.register({
    name = "general",
    d = { [["_d]], "Delete to void buffer" },
}, { prefix = "<leader>", mode = "n" })
