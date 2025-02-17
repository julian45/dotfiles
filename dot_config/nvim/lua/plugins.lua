-- ensures packer is installed if it isn't already
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
    -- manage packer itself
    use 'wbthomason/packer.nvim'

    -- colorscheme, of course
    use 'ishan9299/nvim-solarized-lua'

    -- chezmoi highlighting
    use {
        'alker0/chezmoi.vim',
        config = function() vim.g['chezmoi#use_tmp_buffer'] = true end
    }

    -- fzf
    use { 'junegunn/fzf', run = ":call fzf#install()" }
    use 'junegunn/fzf.vim'

    -- edges
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup() end
    }
    use {
        'aschrab/feline.nvim',
        setup = function() vim.opt.termguicolors = true end,
        config = function() require('feline').setup() end
    }

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    -- LSP attempt
    use 'neovim/nvim-lspconfig'

    -- lint with terraform if present
    if vim.fn.executable('terraform') == 1 then
        use 'hashivim/vim-terraform'
    end

    -- general QoL plugins
    use 'nvim-tree/nvim-web-devicons'
    use {
        'sudormrfbin/cheatsheet.nvim',
        requires = {
            {'nvim-telescope/telescope.nvim'},
            {'nvim-lua/plenary.nvim'},
        }
    }
    use {
        'ggandor/leap.nvim',
        requires = {{'tpope/vim-repeat'}},
        config = function() require('leap').add_default_mappings() end
    }
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }

    -- niceties
    use 'ntpeters/vim-better-whitespace'
    use 'dodie/vim-disapprove-deep-indentation'
    use 'chr4/sslsecure.vim'
    use 'dstein64/vim-startuptime'

    -- for bootstrapping purposes
    if packer_bootstrap then
        require('packer').sync()
    end
end)

require('nvim-treesitter.configs').setup({
    highlight = {
        disable = function()
            -- check if 'filetype' option includes 'chezmoitmpl'
            if string.find(vim.bo.filetype, 'chezmoitmpl') then
                return true
            end
        end,
    },
})

-- https://www.mukeshsharma.dev/2022/02/08/neovim-workflow-for-terraform.html
if vim.fn.executable('terraform') == 1 then
    vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
    vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
    vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
    vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
    vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])
    vim.cmd([[let g:terraform_fmt_on_save=1]])
    vim.cmd([[let g:terraform_align=1]])
end
