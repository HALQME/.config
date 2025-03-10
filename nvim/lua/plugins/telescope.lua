return {
    {
        'nvim-telescope/telescope.nvim',
        event = "VeryLazy",
        keys = {
            {"<leader>tsp", "Telescope"},
            {'<leader>tsc', 'Telescope commands'},
            {'<leader>tsf', 'Telescope find_files'}
        }
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        event = "VeryLazy",
    }
}
