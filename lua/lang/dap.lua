local dap = require('dap')

dap.adapters.coreclr = {
  type = 'executable',
  command = 'C:\\Users\\staffanW\\AppData\\local\\nvim-data\\mason\\packages\\netcoredbg\\netcoredbg\\netcoredbg.exe',
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "attach - netcoredbg",
    request = "attach",
    processId = 21436,
  },
}
