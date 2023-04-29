local ok, dap = pcall(require, 'dap')

if not ok then
  vim.notify('Configuration: DAP not available')
  return
end

local has_vt, vt = pcall(require, 'nvim-dap-virtual-text')

if has_vt then
  vt.setup()
else
  vim.notify('Configuration: nvim-dap-virtual-text not available')
end

local has_dapui, dapui = pcall(require, 'dapui')

if has_dapui then
  dapui.setup()
else
  vim.notify('Configuration: dapui not avilable')
end

local install_dir = vim.fn.stdpath("data") .. "/mason/packages"
local pick_process = require('dap.utils').pick_process

dap.adapters.coreclr = {
  type = 'executable',
  command = install_dir .. '/netcoredbg/netcoredbg/netcoredbg.exe',
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "attach - netcoredbg",
    request = 'attach',
    processId = pick_process
  },
}

dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = {install_dir .. '/chrome-debug-adapter/out/src/chromeDebug.js'}
}

dap.adapters.firefox = {
  type = 'executable',
  command = 'node',
  args = {install_dir .. '/firefox-debug-adapter/dist/adapter.bundle.js'},
}

vim.keymap.set('n', '<Leader>sa', function() dap.run_last() end, { desc = 'Debug Run Last' })
vim.keymap.set('n', '<Leader>sp', function() dap.continue() end, { desc = 'Debug Continue' })
vim.keymap.set('n', '<Leader>so', function() dap.step_over() end, { desc = 'Debug Step Over' })
vim.keymap.set('n', '<Leader>si', function() dap.step_into() end, { desc = 'Debug Step Into' })
vim.keymap.set('n', '<Leader>su', function() dap.step_out() end, { desc = 'Debug Step Out' })
vim.keymap.set('n', '<Leader>sr', function() dap.repl.open() end, { desc = 'Repl Open' })
vim.keymap.set('n', '<Leader>sb', function() dap.toggle_breakpoint() end, { desc = 'Toggle Breakpoint' })
vim.keymap.set('n', '<Leader>sB', function() dap.set_breakpoint() end, { desc = 'Set Breakpoint' })
--vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)

if has_dapui then
  vim.keymap.set('n', '<Leader>ss', function() dapui.open() end, { desc = 'Debug UI Open' })
  vim.keymap.set('n', '<Leader>sS', function() dapui.close() end, { desc = 'Debug UI Close' })
end
