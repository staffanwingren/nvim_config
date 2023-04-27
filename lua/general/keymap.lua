vim.g.mapleader = ' '

local wk = require('which-key')
wk.register{
    ['<Leader>b'] = { name = 'Buffer...' },
    ['<Leader>r'] = { name = 'Refactor...' },
    ['<Leader>t'] = { name = 'Telescope...' },
}

-- General
vim.keymap.set('v', '<Leader>p', '"_dP', { desc = 'Overwrite paste' })
vim.keymap.set('n', '<Leader>bb', ':buffers<CR>:buffer<Space>', { desc = 'Buffer select' })
vim.keymap.set('n', '<Leader>bd', ':buffers<CR>:bdelete<Space>', { desc = 'Buffer delete select' })
vim.keymap.set('n', '[b', ':bprevious<CR>', { desc = 'Buffer previous' })
vim.keymap.set('n', ']b', ':bnext<CR>', { desc = 'Buffer next' })
vim.keymap.set('n', ']q', ':cnext<CR>', { desc = 'Quicklist next' })
vim.keymap.set('n', ']Q', ':clast<CR>', { desc = 'Quicklist last' })
vim.keymap.set('n', '[q', ':cprevious<CR>', { desc = 'Quicklist previous' })
vim.keymap.set('n', '[Q', ':cfirst<CR>', { desc = 'Quicklist first' })
vim.keymap.set('n', ']l', ':lnext<CR>', { desc = 'Locallist next' })
vim.keymap.set('n', ']L', ':llast<CR>', { desc = 'Locallist last' })
vim.keymap.set('n', '[l', ':lprevious<CR>', { desc = 'Locallist previous' })
vim.keymap.set('n', '[L', ':lfirst<CR>', { desc = 'Locallist first' })
vim.keymap.set('n', ']a', ':next<CR>', { desc = 'Argumentlist next' })
vim.keymap.set('n', ']A', ':last<CR>', { desc = 'Argumentlist last' })
vim.keymap.set('n', '[a', ':previous<CR>', { desc = 'Argumentlist previous' })
vim.keymap.set('n', '[A', ':first<CR>', { desc = 'Argumentlist first' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Diagnostics open' })
vim.keymap.set('n', '<leader>D', vim.diagnostic.setloclist, { desc = 'Diagnostics populate locallist' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Diagnostics previous' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Diagnostics next' })
vim.keymap.set('n', '-', ':Explore<CR>', { desc = 'Explore file directory' })
vim.keymap.set('n', '<Leader>-', ':Explore.<CR>', { desc = 'Explore current directory' })
vim.keymap.set('n', '<Leader>h', ':nohlsearch<CR>', { desc = 'No Hightlight'})

-- Telescope
vim.keymap.set(
    'n',
    '<leader>tf',
    ':Telescope find_files path_display={"tail"}<CR>',
    { desc = 'Telescope file search' }
)
vim.keymap.set(
    'n',
    '<leader>tF',
    ':Telescope git_files path_display={"tail"}<CR>',
    { desc = 'Telescope git search' }
)
vim.keymap.set(
    'n',
    '<leader>tg',
    ':Telescope live_grep<CR>',
    { desc = 'Telescope live grep' }
)
vim.keymap.set(
    'n',
    '<leader>tb',
    ':Telescope buffers path_display={"tail"}<CR>',
    { desc = 'Telescope buffer search' }
)
vim.keymap.set(
    'n',
    '<leader>th',
    ':Telescope help_tags<CR>',
    { desc = 'Telescope help search' }
)
vim.keymap.set(
    'n',
    '<leader>ts',
    ':Telescope lsp_workspace_symbols<CR>',
    { desc = 'Telescope symbol search' }
)
