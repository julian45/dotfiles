return {
    -- solarized
    {
        "ishan9299/nvim-solarized-lua",
        lazy = false, -- make sure this is loaded during startup
        priority = 1000, -- make sure to load before all other plugins
        config = function()
            vim.cmd([[colorscheme solarized]])
        end,
    }
}