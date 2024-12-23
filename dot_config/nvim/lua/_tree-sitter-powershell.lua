-- partially inspired by
-- https://medium.com/@kacpermichta33/powershell-development-in-neovim-23ed44d453b4
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
