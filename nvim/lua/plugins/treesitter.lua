return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        require('nvim-treesitter').setup({
            ensure_installed = 'all',
            highlight = {
                enable = true,
            },
            indent = { enable = true }
        })
    end,
}
