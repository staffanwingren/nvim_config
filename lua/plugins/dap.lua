return {
  "mfussenegger/nvim-dap",
  opts = function(_, _)
    local ok, dap = pcall(require, "dap")

    if not ok then
      vim.notify("Configuration: DAP not available")
      return
    end

    local install_dir = vim.fn.stdpath("data") .. "/mason/packages"
    local pick_process = require("dap.utils").pick_process

    dap.adapters.coreclr = {
      type = "executable",
      command = install_dir .. "/netcoredbg/netcoredbg/netcoredbg.exe",
      args = { "--interpreter=vscode" },
    }

    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
          return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "", "file")
        end,
      },
      {
        type = "coreclr",
        name = "attach - netcoredbg",
        request = "attach",
        processId = pick_process,
      },
    }

    dap.adapters.chrome = {
      type = "executable",
      command = "node",
      args = { install_dir .. "/chrome-debug-adapter/out/src/chromeDebug.js" },
    }

    dap.adapters.firefox = {
      type = "executable",
      command = "node",
      args = { install_dir .. "/firefox-debug-adapter/dist/adapter.bundle.js" },
    }
  end,
}
