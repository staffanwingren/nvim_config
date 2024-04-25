return {
    'nvim-tree/nvim-web-devicons',
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
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
    },
  }
