return {
    {
        "lewis6991/gitsigns.nvim",
        config = function() require("gitsigns").setup() end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function() require("lualine").setup() end,
    },
}