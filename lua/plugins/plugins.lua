return {
    'nvim-tree/nvim-web-devicons',
    'tpope/vim-sleuth',
    'tpope/vim-surround',
    'tpope/vim-fugitive',
    {
      "NeogitOrg/neogit",
      dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "sindrets/diffview.nvim",        -- optional - Diff integration
        "nvim-telescope/telescope.nvim", -- optional
      },
      config = true
    }
}
