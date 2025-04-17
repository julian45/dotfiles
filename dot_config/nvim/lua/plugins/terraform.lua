return {
    {
        "hashivim/vim-terraform",
        cond = function()
            return vim.fn.executable("terraform")
        end,
    },
}