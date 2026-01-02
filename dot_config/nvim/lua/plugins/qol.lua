return {
    { "nvim-tree/nvim-web-devicons", lazy = true },
    {
        "numToStr/Comment.nvim",
        config = function() require("Comment").setup() end,
    },
}
