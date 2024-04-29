local lsp_status = require("lsp-status")

lsp_status.config {
    status_symbol = " ",
    indicator_ok = " "
}

local function get_lsp_status()
    local num_clients = vim.lsp.get_active_clients()

    if #num_clients > 0 then
        local status = lsp_status.status()
        if status == "" then status = "No LSP status" end
        return status
    end

    return "[No LSP]"
end

-- local navic = require("nvim-navic")

require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = " ", right = " " },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = {
            "branch",
            "diff",
            {
                "diagnostics",
                sources = { "nvim_lsp" },
                sections = { "error", "warn", "info", "hint" },
                diagnostics_color = {
                    error = "DiagnosticError",
                    warn = "DiagnosticWarn",
                    info = "DiagnosticInfo",
                    hint = "DiagnosticHint",
                },
                symbols = {
                    error = "E",
                    warn = "W",
                    info = "I",
                    hint = "H",
                },
                colored = true,
                update_in_insert = false,
                always_visible = false,
            },
        },
        lualine_c = { "filename", get_lsp_status },
        lualine_x = { "encoding", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    inactive_sessions = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = nil,
    winbar = {},
    inactive_winbar = {},
    extensions = {},
}
