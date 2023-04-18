if vim.g.neovide then
    vim.o.guifont = 'JetBrainsMono NF:h11'
    vim.g.neovide_hide_mouse_when_typing = true
--    vim.g.neovide_padding_top = 20
--    vim.g.neovide_padding_bottom = 10
--    vim.g.neovide_padding_left = 10
--    vim.g.neovide_padding_right = 10

    vim.keymap.set(
        '',
        '<Leader>F',
        function()
            vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
        end,
        { desc = 'Neovide toggle fullscreen' }
    )
end
