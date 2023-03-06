vim.g.mapleader = "\\"

-- Handle åÅäÄöÖ
vim.keymap.set({'','!'}, '<M-C-w>', 'å')
vim.keymap.set({'','!'}, '<M-C-S-w>', 'Å')
vim.keymap.set({'','!'}, '<M-C-q>', 'ä')
vim.keymap.set({'','!'}, '<M-C-S-q>', 'Ä')
vim.keymap.set({'','!'}, '<M-C-p>', 'ö')
vim.keymap.set({'','!'}, '<M-C-S-p>', 'Ö')

-- General
--vim.keymap.set('n', '<C-v>', '<C-q>')
vim.keymap.set('v', '<Leader>p', '"_dP')

-- Telescope
vim.keymap.set('n', '<leader>tf', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>tg', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>tb', ':Telescope buffers<CR>')
vim.keymap.set('n', '<leader>th', ':Telescope help_tags<CR>')
vim.keymap.set('n', '<leader>ts', ':Telescope lsp_workspace_symbols<CR>')
