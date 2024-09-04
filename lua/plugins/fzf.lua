return {
    "ibhagwan/fzf-lua",

    dependencies = { "nvim-tree/nvim-web-devicons" },

    keys = {
        { "<leader>f?", "<cmd>Fzf builtin<cr>", },
        { "<leader>ff", "<cmd>Fzf files<cr>", },
        { "<leader>fb", "<cmd>Fzf buffers<cr>", },
        { "<leader>fs", "<cmd>Fzf live_grep_native<cr>", },
    },

    cmd = "Fzf",
}
