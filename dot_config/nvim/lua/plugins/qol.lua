return {
    { "nvim-tree/nvim-web-devicons", lazy = true },
    {
        "sudormrfbin/cheatsheet.nvim",
        dependencies = {
            { "nvim-telescope/telescope.nvim" },
            { "nvim-lua/plenary.nvim" },
        }
    },
    {
        "ggandor/leap.nvim",
        dependencies = { "tpope/vim-repeat" },
        config = function()
            local leap = require('leap')
            vim.keymap.set('n', 's', function ()
                require('leap').leap({ target_windows = { vim.api.nvim_get_current_win() } })
            end)
            vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
            vim.keymap.set('n',             'S', '<Plug>(leap-from-window)')
        end
    },
    {
        "numToStr/Comment.nvim",
        config = function() require("Comment").setup() end,
    },
}
