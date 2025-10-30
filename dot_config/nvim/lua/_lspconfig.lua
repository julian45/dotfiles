local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<Leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<Leader>td', vim.lsp.buf.type_definition, bufopts)
end

local home_directory = os.getenv('HOME')
if home_directory == nil then
    home_directory = os.getenv('USERPROFILE')
end

if vim.fn.executable('pwsh') == 1 then
    vim.lsp.config('powershell_es', {
        bundle_path = '~/extras/PowerShellEditorServices',
        settings = { powershell = { codeFormatting = { Preset = 'OTBS' } } }
    })
    vim.lsp.enable('powershell_es')
end

if vim.fn.executable('terraform') == 1 then
    vim.lsp.enable('terraformls')
    vim.lsp.enable('tflint')
end
