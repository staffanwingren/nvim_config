return {
  {
    "Issafalcon/neotest-dotnet",
    lazy = true,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "Issafalcon/neotest-dotnet",
    },
    cmd = { "Neotest" },
    opts = function()
      return {
        adapters = {
          require("neotest-dotnet")
        },
      }
    end,
  },
}
