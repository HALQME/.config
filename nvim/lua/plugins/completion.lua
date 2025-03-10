return {
    {
        'L3MON4D3/LuaSnip',
        event = 'InsertEnter',
        config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
        end,
    },
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        config = function()
            local cmp = require('cmp')
            local luasnip = require('luasnip')

            -- VSCode-like snippetsのロード
            require('luasnip.loaders.from_vscode').lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-k>'] = cmp.mapping.select_prev_item(),
                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'cmdline' },
                    { name = 'nvim_lua' },
                }),
            })
        end,
    },
    {
        'hrsh7th/cmp-nvim-lsp',
        event = 'InsertEnter',
        config = function()
            -- lspのハンドラーに設定
            local lspconfig = require('lspconfig')
            local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
            lspconfig.lua_ls.setup({
                capabilities = lsp_capabilities,
            })
        end,
    },
    {
        'hrsh7th/cmp-buffer',
        event = 'InsertEnter',
    },
    {
        'hrsh7th/cmp-path',
        event = 'InsertEnter',
    },
    {
        'hrsh7th/cmp-cmdline',
        event = 'InsertEnter',
    },
    {
        'hrsh7th/cmp-nvim-lua',
        event = 'InsertEnter',
    },
    {
        'saadparwaiz1/cmp_luasnip',
        event = 'InsertEnter',
    }
}

