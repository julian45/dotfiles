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
        config = function() require("leap").add_default_mappings() end,
    },
    {
        "numToStr/Comment.nvim",
        config = function() require("Comment").setup() end,
    },
}