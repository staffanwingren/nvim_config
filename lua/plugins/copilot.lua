return {
    'copilot.vim',
    enabled = true,
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
}
