local dap = require('dap')

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

vim.keymap.set('n', '<Leader>sy', function() require('dap').continue() end, { desc = 'Debug Continue' })
vim.keymap.set('n', '<Leader>so', function() require('dap').step_over() end, { desc = 'Debug Step Over' })
vim.keymap.set('n', '<Leader>si', function() require('dap').step_into() end, { desc = 'Debug Step Into' })
vim.keymap.set('n', '<Leader>su', function() require('dap').step_out() end, { desc = 'Debug Step Out' })
vim.keymap.set('n', '<Leader>sb', function() require('dap').toggle_breakpoint() end, { desc = 'Toggle Breakpoint' })
vim.keymap.set('n', '<Leader>sB', function() require('dap').set_breakpoint() end, { desc = 'Set Breakpoint' })
--vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>sr', function() require('dap').repl.open() end, { desc = 'Open Repl' })
--vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
--vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
--  require('dap.ui.widgets').hover()
--end)
--vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
--      require('dap.ui.widgets').preview()
--    end)
--vim.keymap.set('n', '<Leader>df', function()
--      local widgets = require('dap.ui.widgets')
--      widgets.centered_float(widgets.frames)
--    end)
--    vim.keymap.set('n', '<Leader>ds', function()
--      local widgets = require('dap.ui.widgets')
--      widgets.centered_float(widgets.scopes)
--    end)

