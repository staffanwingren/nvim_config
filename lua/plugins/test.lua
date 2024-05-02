return {
  {
    "Issafalcon/neotest-dotnet",
    lazy = true,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "Issafalcon/neotest-dotnet",
    },
    enabled = false,
    opts = function()
      return {
        adapters = {
          require("neotest-dotnet")
        },
      }
    end,
  },
}
