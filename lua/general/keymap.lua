vim.g.mapleader = "\\"

-- Handle åÅäÄöÖ
vim.keymap.set({'','!'}, '<M-C-w>', 'å')
vim.keymap.set({'','!'}, '<M-C-S-w>', 'Å')
vim.keymap.set({'','!'}, '<M-C-q>', 'ä')
vim.keymap.set({'','!'}, '<M-C-S-q>', 'Ä')
vim.keymap.set({'','!'}, '<M-C-p>', 'ö')
vim.keymap.set({'','!'}, '<M-C-S-p>', 'Ö')

-- General
vim.keymap.set('v', '<Leader>p', '"_dP')
vim.keymap.set('n', '<Leader>bo', ':buffers<CR>')
vim.keymap.set('n', '<Leader>bb', ':buffers<CR>:buffer<Space>')
vim.keymap.set('n', '<Leader>bd', ':buffers<CR>:bdelete<Space>')
vim.keymap.set('n', '<Leader>bp', ':bprevious<CR>')
vim.keymap.set('n', '<Leader>bn', ':bnext<CR>')
vim.keymap.set('n', '<Leader>co', ':botright copen<CR>')
vim.keymap.set('n', '<Leader>cc', ':cclose<CR>')
vim.keymap.set('n', '<Leader>cf', ':cnewer<CR>')
vim.keymap.set('n', '<Leader>cb', ':colder<CR>')
vim.keymap.set('n', '<Leader>cn', ':cnext<CR>')
vim.keymap.set('n', '<Leader>cN', ':clast<CR>')
vim.keymap.set('n', '<Leader>cp', ':cprevious<CR>')
vim.keymap.set('n', '<Leader>cP', ':cfirst<CR>')
vim.keymap.set('n', '-', ':Explore<CR>')
vim.keymap.set('n', '<Leader>-', ':Explore.<CR>')

-- Telescope
vim.keymap.set('n', '<leader>tf', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>tg', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>tb', ':Telescope buffers<CR>')
vim.keymap.set('n', '<leader>th', ':Telescope help_tags<CR>')
vim.keymap.set('n', '<leader>ts', ':Telescope lsp_workspace_symbols<CR>')
