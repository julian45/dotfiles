return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false, -- tagged releases tend to be a bit old
        build = ":TSUpdate",
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        opts = {
            highlight = {
                disable = function()
                    -- check if 'filetype' option includes 'chezmoitmpl'
                    if string.find(vim.bo.filetype, 'chezmoitmpl') then
                        return true
                    end
                end,
            },
            indent = { enable = true },
            ensure_installed = {
                "bash",
                "c",
                "diff",
                "markdown",
                "printf",
                "python",
                "vim",
                "vimdoc",
                "xml",
            },

        },
        config = function()
            require("nvim-treesitter.configs")
            if vim.fn.executable("pwsh") == 1 then
                local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
                parser_config.powershell = {
                    install_info = {
                        url = "https://github.com/airbus-cert/tree-sitter-powershell",
                        branch = "main",
                        files = { "src/parser.c", "src/scanner.c" },
                    },
                    filetype = "ps1",
                    used_by = { "psm1", "psd1", "pssc", "psxml", "cdxml" }
                }
            end
        end,
    },
}
