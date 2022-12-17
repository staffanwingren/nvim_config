vim.g.mapleader = " "

local has_telescope = packer_plugins['telescope.nvim'] and packer_plugins['telescope.nvim'].loaded
if has_telescope then
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
    vim.keymap.set('n', '<leader>tg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>th', builtin.help_tags, {})
end
