local lsp = require('lsp-zero')

lsp.preset('recommended')

local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<Tab>'] = cmp.mapping.confirm(),
    ['<leader>c'] = cmp.mapping.abort(),
})

cmp_mappings['<S-Tab>'] = nil
cmp_mappings['<CR>'] = nil
cmp_mappings['<C-e>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.setup()

vim.opt.signcolumn = 'yes'
