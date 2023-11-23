return {
    'mfussenegger/nvim-dap',
    dependencies = {
        {
            'rcarriga/nvim-dap-ui',
            dependencies = {
                'theHamsta/nvim-dap-virtual-text',
            },
            config = function()
                local dapui = require('dapui')
                dapui.setup()
                vim.keymap.set(
                    'n',
                    '<Leader>ss',
                    function() dapui.toggle() end,
                    { desc = 'Debug UI Toggle' }
                )
            end,
        },
        'nvim-telescope/telescope.nvim',
        'nvim-telescope/telescope-dap.nvim',
    },
    config = function()
        local dap = require('dap')
        local install_dir = vim.fn.stdpath("data") .. "/mason/packages"
        local pick_process = require('dap.utils').pick_process

        require('dapui').setup()

        dap.adapters.coreclr = {
          type = 'executable',
          command = install_dir .. '/netcoredbg/netcoredbg/netcoredbg.exe',
          args = {'--interpreter=vscode'}
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
            args = {install_dir .. '/chrome-debug-adapter/out/src/chromeDebug.js'}
        }

        vim.keymap.set(
            'n',
            '<Leader>sa',
            function() dap.run_last() end,
            { desc = 'Debug Run Last' }
        )
        vim.keymap.set(
            'n',
            '<Leader>sp',
            function() dap.continue() end,
            { desc = 'Debug Continue' }
        )
        vim.keymap.set(
            'n',
            '<Leader>so',
            function() dap.step_over() end,
            { desc = 'Debug Step Over' }
        )
        vim.keymap.set(
            'n',
            '<Leader>si',
            function() dap.step_into() end,
            { desc = 'Debug Step Into' }
        )
        vim.keymap.set(
            'n',
            '<Leader>su',
            function() dap.step_out() end,
            { desc = 'Debug Step Out' }
        )
        vim.keymap.set(
            'n',
            '<Leader>sr',
            function() dap.repl.open() end,
            { desc = 'Repl Open' }
        )
        vim.keymap.set(
            'n',
            '<Leader>sb',
            function() dap.toggle_breakpoint() end,
            { desc = 'Toggle Breakpoint' }
        )
        vim.keymap.set(
            'n',
            '<Leader>sB',
            function() dap.set_breakpoint() end,
            { desc = 'Set Breakpoint' }
        )
if has_dapui then
end
    end,
}
