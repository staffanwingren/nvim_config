-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--
-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'morhetz/gruvbox'
    use 'ryanoasis/vim-devicons'
    use 'nvim-lualine/lualine.nvim'

    use('tpope/vim-sleuth')
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = {{ 'nvim-lua/plenary.nvim' }}
    }

    use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},

        -- Snippets
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
      }
    }

    use 'jose-elias-alvarez/null-ls.nvim'

    use 'mfussenegger/nvim-dap'
    use 'nvim-telescope/telescope-dap.nvim'

    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    use {
      'folke/which-key.nvim',
      config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require('which-key').setup{}
      end
    }
end)
