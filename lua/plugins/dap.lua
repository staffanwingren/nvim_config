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
    --{
    --    'mxsdev/nvim-dap-vscode-js',
    --    config = function()
    --        require('dap-vscode-js').setup{
    --            debugger_path = "C:\\Users\\staffanw\\Development\\vscode-js-debug",
    --            adapters = { 'pwa-node', 'pwa-chrome' },
    --        }
    --    end,
    --},
    {
        'mfussenegger/nvim-dap',
        lazy = true,
        config = function()
            local dap = require('dap')
            --local install_dir = vim.fn.stdpath("data") .. "/mason/packages/"

            local netcoredbg_exe = os.getenv("NETCOREDBG_EXE")
            if netcoredbg_exe ~= nil and netcoredbg_exe ~= '' then
                dap.adapters.coreclr = {
                    type = 'executable',
                    --command = mason_bin .. "netcoredbg.cmd",
                    --command = install_dir .. 'netcoredbg/netcoredbg/netcoredbg.exe',
                    command = netcoredbg_exe,
                    args = { '--interpreter=vscode' }
                }

                dap.configurations.cs = {
                    {
                        type = "coreclr",
                        name = "attach - netcoredbg",
                        request = "attach",
                        processId = require('dap.utils').pick_process,
                    },
                }

                dap.configurations.fsharp = {
                    {
                        type = "coreclr",
                        name = "attach - netcoredbg",
                        request = "attach",
                        processId = require('dap.utils').pick_process,
                    },
                }
            end

            --dap.adapters.chrome = {
            --    type = "executable",
            --    command = "node",
            --    args = { install_dir .. 'chrome-debug-adapter/out/src/chromeDebug.js' }
            --}
        end,
    }
}
