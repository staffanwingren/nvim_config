return {
    {
        "tpope/vim-fugitive",
        cmd = { "Git" },
    },
    {
        "NeogitOrg/neogit",
        enabled = false,
        dependencies = {
            "nvim-lua/plenary.nvim", -- required
            "sindrets/diffview.nvim", -- optional - Diff integration
            "nvim-telescope/telescope.nvim", -- optional
        },
        config = true,
    },
    {
        "lewis6991/gitsigns.nvim",
        enabled = true,
        config = true,
    },
    {
      "echasnovski/mini.diff",
      version = "*",
      enabled = false,
      config = function()
          require("mini.diff").setup{}
      end,
    },
}
