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
                    '<F7>',
                    function() dapui.toggle() end,
                    { desc = 'Debug UI Toggle' }
                )
            end,
        },
        'nvim-telescope/telescope.nvim',
        'nvim-telescope/telescope-dap.nvim',
    },
    keys = {
        "<F6>",
        "<F8>",
        "<F9>",
        "<S-F9>",
        "<F10>",
        "<F11>",
    },
    config = function()
        local dap = require('dap')
        local install_dir = vim.fn.stdpath("data") .. "/mason/packages"
        local pick_process = require('dap.utils').pick_process

        require('dapui').setup()

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

        vim.keymap.set(
            'n',
            '<F6>',
            function() dap.run_last() end,
            { desc = 'Debug Run Last' }
        )
        vim.keymap.set(
            'n',
            '<F5>',
            function() dap.continue() end,
            { desc = 'Debug Continue' }
        )
        vim.keymap.set(
            'n',
            '<F10>',
            function() dap.step_over() end,
            { desc = 'Debug Step Over' }
        )
        vim.keymap.set(
            'n',
            '<F11>',
            function() dap.step_into() end,
            { desc = 'Debug Step Into' }
        )
        vim.keymap.set(
            'n',
            '<S-F9>',
            function() dap.step_out() end,
            { desc = 'Debug Step Out' }
        )
        vim.keymap.set(
            'n',
            '<F8>',
            function() dap.repl.open() end,
            { desc = 'Repl Open' }
        )
        vim.keymap.set(
            'n',
            '<F9>',
            function() dap.toggle_breakpoint() end,
            { desc = 'Toggle Breakpoint' }
        )
    end,
}
