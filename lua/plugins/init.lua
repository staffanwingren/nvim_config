-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--
-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'morhetz/gruvbox'
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use {
        'nvim-telescope/telescope.nvim', 
        tag = '0.1.0',
        requires = {{ 'nvim-lua/plenary.nvim' }} 
    }
end)
