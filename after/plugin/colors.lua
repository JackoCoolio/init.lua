local default_color = "oxocarbon"

local configs
function ColorMyPencils(color)
    color = color or default_color

    local config = configs[color]

    if type(config) == "function" then
        config()
    end

    vim.cmd.colorscheme(color)
end

configs = {
    catppuccin = function()
        require("catppuccin").setup({
            flavour = "mocha",
            background = {
                light = "latte",
                dark = "mocha",
            },
            transparent_background = false,
            show_end_of_buffer = true, -- show '~' after buffer
            term_colors = false,
            dim_inactive = {
                enabled = true,
                shade = "dark",
                percentage = 0.15,
            },
            no_italic = false,
            no_bold = false,
            styles = {
                comments = { "italic" },
                conditionals = { "italic" },
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
            },
            color_overrides = {},
            custom_highlights = {},
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                telescope = true,
                notify = false,
                mini = false,
            },
        })
    end,
    kanagawa = function()
        require("kanagawa").setup {
            compile = true,
            undercurl = true,
            transparent = false,
        }
    end,
}

-- initialize colors by default
ColorMyPencils()
