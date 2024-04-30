return {
  {
    "stevearc/conform.nvim",
    opts = {
      format = {
        timeout_ms = 5000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
        lsp_fallback = true, -- not recommended to change
      },
      formatters_by_ft = {
        cs = { "csharpier" },
        lua = { "stylua" },
      },
      formatters = {
        --csharpier = {
        --  command = "dotnet-csharpier",
        --  args = { "--write-stdout" },
        --},
      },
    },
    ft = { "cs", "lua" },
    cmd = { "ConformInfo" },
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  }
}
