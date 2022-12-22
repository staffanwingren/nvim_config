vim.g.mapleader = " "

-- General
--vim.keymap.set('n', '<C-v>', '<C-q>')

--  NvimTree
vim.keymap.set('n', '<Leader>e', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<Leader>E', ':NvimTreeFindFile<CR>')

-- Telescope
vim.keymap.set('n', '<leader>tf', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>tg', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>tb', ':Telescope buffers<CR>')
vim.keymap.set('n', '<leader>th', ':Telescope help_tags<CR>')
vim.keymap.set('n', '<leader>ts', ':Telescope lsp_workspace_symbols<CR>')

