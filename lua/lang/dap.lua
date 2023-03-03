local dap = require('dap')

local install_dir = vim.fn.stdpath("data") .. "/mason/packages"

dap.adapters.coreclr = {
  type = 'executable',
  command = install_dir .. '/netcoredbg/netcoredbg/netcoredbg.exe',
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = function()
      local request = vim.fn.input('Launch/Attach: ')
      local shortcut = string.sub(request, 1, 1)
      if shortcut == 'l' then
        return 'launch'
      elseif shortcut == 'a' then
        return 'attach'
      else
        return request
      end
    end,
    program = function()
        return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/', 'file')
    end,
    processId = function()
      return vim.fn.input('Process ID: ')
    end
  },
}

--dap.configurations.cs = {
--  {
--    type = "coreclr",
--    name = "attach - netcoredbg",
--    request = "attach",
--    processId = 21436,
--  },
--}

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<F9>', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<F8>', function() require('dap').set_breakpoint() end)
--vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<F7>', function() require('dap').repl.open() end)
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

