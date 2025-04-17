return {
    -- ref: https://github.com/alker0/chezmoi.vim?tab=readme-ov-file#-how-can-i-make-it-work-with-lazynvim
    "alker0/chezmoi.vim",
    lazy = false,
    init = function()
        -- required
        vim.g["chezmoi#use_tmp_buffer"] = true
        -- add any other opts as needed here
    end,
}