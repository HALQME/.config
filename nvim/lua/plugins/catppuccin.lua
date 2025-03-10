return {
    'catppuccin/nvim',
    name = 'catppuccin',
    event='VimEnter',
    priority = 1000, -- Ensure it loads early
    config = function()
        require('catppuccin').setup({
            flavour = 'macchiato',         -- latte, frappe, macchiato, mocha
            transparent_background = true, -- disables setting the background color.
            show_end_of_buffer = false,    -- shows the '~' characters after the end of buffers
            term_colors = true,            -- sets terminal colors (e.g. `g:terminal_color_0`)
            no_italic = false,             -- Force no italic
            no_bold = false,               -- Force no bold
            no_underline = false,          -- Force no underline
            color_overrides = {},
            default_integrations = true,
            integrations = {
                nvimtree = true,
                treesitter = true,
                telescope = {
                    enable = true,
                    style = 'nvchad'
                }
            },
            custom_highlights = function(colors)
                return {
                    Comment = { fg = colors.surface },
                    LineNr = { fg = colors.overlay2 }
                }
            end
        })

        -- Load the theme
        vim.cmd.colorscheme('catppuccin')
    end,
}
