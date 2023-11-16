local M = {}

M.setup = function()
  local ok, dap = pcall(require, "dap")

  if not ok then
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
end

return M
