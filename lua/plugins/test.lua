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
    config = function()
      require'neotest'.setup{
        adapters = {
          require("neotest-dotnet"){
            dap = {
              adapter_name = "coreclr"
            },
            discovery_root = "solution",
          }
        },
      }
    end,
  },
}
