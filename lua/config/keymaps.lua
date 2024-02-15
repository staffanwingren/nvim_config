vim.keymap.set('v', '<Leader>p', '"_dP', { desc = 'Overwrite paste' })
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

vim.keymap.set('n', '<Leader>o', 'm\'o<Esc><C-o>', { desc = 'Open line below' })
vim.keymap.set('n', '<Leader>O', 'm\'O<Esc><C-o>', { desc = 'Open line above' })
vim.keymap.set('n', '<Leader>/', ':nohlsearch<CR>', { desc = 'No Hightlight' })
vim.keymap.set('n', '<Leader>b', ':buffers<CR>:buffer ', { desc = 'List buffers' })
vim.keymap.set({ 'n', 'v' }, '<Leader>y', '"+y', { desc = 'Yank to clipboard' })
vim.keymap.set({ 'n', 'v' }, '<Leader>p', '"+p', { desc = 'Paste (aft) from clipboard' })
vim.keymap.set({ 'n', 'v' }, '<Leader>P', '"+P', { desc = 'Past (for) from clipboard' })
