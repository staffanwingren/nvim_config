return {
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio',
        },
        keys = {
            {'<F7>', function() require'dapui'.toggle() end, desc = 'Debug UI Toggle' },
            { '<F5>', function() require'dap'.continue() end, desc = 'Debug Continue' },
            { '<F6>', function() require'dap'.run_last() end, desc = 'Debug Run Last' },
            { '<F8>', function() require'dap'.repl.open() end, desc = 'Repl Open' },
            { '<F9>', function() require'dap'.toggle_breakpoint() end, desc = 'Toggle Breakpoint' },
            { '<S-F9>', function() require'dap'.step_out() end, desc = 'Debug Step Out' },
            { '<F10>', function() require'dap'.step_over() end, desc = 'Debug Step Over' },
            { '<F11>', function() require'dap'.step_into() end, desc = 'Debug Step Into' },
        },
        config = function()
            require'dapui'.setup()
        end,
    },
    {
        'mfussenegger/nvim-dap',
        lazy = true,
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'nvim-telescope/telescope-dap.nvim',
        },
        config = function()
            local dap = require('dap')
            local install_dir = vim.fn.stdpath("data") .. "/mason/packages"
            local pick_process = require('dap.utils').pick_process

            dap.adapters.coreclr = {
                type = 'executable',
                command = install_dir .. '/netcoredbg/netcoredbg/netcoredbg.exe',
                args = { '--interpreter=vscode' }
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
                args = { install_dir .. '/chrome-debug-adapter/out/src/chromeDebug.js' }
            }

            require('telescope').load_extension('dap')
        end,
    }
}
