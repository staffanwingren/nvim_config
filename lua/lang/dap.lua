--local has_neotest, neotest = pcall(require, 'neotest')
--
--if has_neotest then
--  local dotnet = require('neotest-dotnet')
--  neotest.setup{
--    adapters = {
--      dotnet{
--        discovery_root = 'solution'
--      },
--    },
--  }
--
--  local run_test = function()
--    if vim.bo.filetype == "cs" then
--      require("neotest").run.run({ strategy = require("neotest-dotnet.strategies.netcoredbg"), is_custom_dotnet_debug = true })
--    else
--      require("neotest").run.run({ strategy = "dap" })
--    end
--  end
--
--  vim.api.nvim_create_user_command(
--    'Test',
--    run_test,
--    {
--      force = false,
--      desc = 'Run unit-tests with neotest',
--    })
--else
--  vim.notify('Configuration: neotest not available')
--end
