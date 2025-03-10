return {
    -- LSPの設定
    {
        'neovim/nvim-lspconfig',
        event = 'InsertEnter',
        config = function()
            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup({})
        end,
    },
    {
        'williamboman/mason.nvim',
        event = 'VeryLazy',
        config = function()
            require("mason").setup()
        end,

    },
    {
        'williamboman/mason-lspconfig.nvim',
        event = 'VeryLazy',
        config = function()
            require("mason-lspconfig").setup()
            require("mason-lspconfig").setup_handlers {
            }
        end,
    }
}
