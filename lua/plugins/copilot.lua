return {
    {
        'github/copilot.vim',
        enabled = false,
        config = function()
            vim.g.copilot_no_tab_map = true
            vim.keymap.set(
                'i',
                '<M-Enter>',
                'copilot#Accept(\'<CR>\')',
                {
                    silent = true,
                    expr = true,
                    replace_keycodes = false,
                    desc = 'Copilot Accept'
                }
            )
        end,
    },
    {
        'zbirenbaum/copilot.lua',
        event = 'InsertEnter',
        opts = {
            suggestion = { enabled = false },
            panel = { enabled = false },
        },
    },
    {
        'zbirenbaum/copilot-cmp',
        config = function()
            require 'copilot_cmp'.setup()
        end
    },
}
