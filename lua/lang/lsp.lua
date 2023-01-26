vim.g.OmniSharp_server_use_net6 = 1
local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.set_preferences({
    set_lsp_keymaps = false
})

lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }
    local bind = vim.keymap.set

    bind('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    bind('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    bind('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    bind('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    bind('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    bind('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    bind('n', '<leader>ro', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    bind('n', '<leader>ho', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    bind('n', '<leader>hs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    bind('n', '<leader>io', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    bind('n', '<leader>ip', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
    bind('n', '<leader>in', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
    bind('n', '<leader>rf', ':LspZeroFormat<cr>', opts)
end)

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

-- Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
