vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Update the package manager itself
    use {'wbthomason/packer.nvim', opt = true}
    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    -- Completion
    use {'hrsh7th/nvim-compe', opt = true}
    -- Language server
    use 'neovim/nvim-lspconfig' -- Main configuration
    use 'glepnir/lspsaga.nvim' -- Extra capabilities
    use 'onsails/lspkind-nvim' -- Images in lsp completion
    -- Lisp repl
    use 'Olical/conjure'
    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter',
        cmd = "TSUpdate",
        opt = true
    }
    -- Creates mapping to comment lines fast
    use 'tpope/vim-commentary'
    -- Indentation guide
    use 'sbdchd/indentline.vim'
    use 'lukas-reineke/indent-blankline.nvim'
    -- Snippets
    use 'SirVer/ultisnips'
    -- Git signs in signcoloumn
    use {'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function()
            require('gitsigns').setup()
        end
    }
    -- Icons
    use 'kyazdani42/nvim-web-devicons'
    -- Auto close parentheses
    use 'cohama/lexima.vim'
    -- Html automitation
    use 'mattn/emmet-vim'
    -- Filetype plugins
    use 'lepture/vim-jinja'
    use '~/Projects/Vim/Org'
    use '~/Projects/Vim/rhai.vim'
    use 'LnL7/vim-nix'
    use 'bakpakin/fennel.vim'
    use 'vim-crystal/vim-crystal'
    use 'kovisoft/slimv'
    use 'cespare/vim-toml'
    use 'wlangstroth/vim-racket'
    use 'ledger/vim-ledger'
    -- Line
    use 'hoob3rt/lualine.nvim'
end)
