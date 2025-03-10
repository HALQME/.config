return {
    {
        'folke/noice.nvim',
        event = 'VeryLazy',
        opts = {
            lsp = {
                override = {
                    ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                    ['vim.lsp.util.stylize_markdown'] = true,
                    ['cmp.entry.get_documentation'] = true,
                },
            },
            presets = {
                bottom_search = false, -- use a classic bottom cmdline for search
                command_palette = true, -- position the cmdline and popupmenu together
                inc_rename = true, -- enables an input dialog for inc-rename.nvim
            },
            messages = {
                enabled = true, -- enables the Noice messages UI
                view = 'mini', -- default view for messages
                view_error = 'notify', -- view for errors
                view_warn = 'notify', -- view for warnings
                view_history = 'messages', -- view for :messages
                view_search = 'mini', -- view for search count messages. Set to `false` to disable
            },
            routes = {
                {
                    filter = {
                        event = "msg_show",
                        kind = "",
                        find = "written",
                    },
                    opts = { skip = true },
                },
            },

        },
    },
    {
        'rcarriga/nvim-notify',
        event = "VeryLazy",
        config = function()
            require("notify").setup({
                render = "compact",
                stages = "slide",
                timeout = 1500,
                background_colour = "#000000",
                text_colour = "#ffffff",
                icons = {
                    ERROR = " ",
                    WARN  = " ",
                    INFO  = " ",
                    DEBUG = " ",
                    TRACE = "✎ ",
                },
            })
        end,
    }
}
