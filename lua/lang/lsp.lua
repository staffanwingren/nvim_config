vim.g.OmniSharp_server_use_net6 = 1

local lsp = require('lsp-zero').preset('minimal')

lsp.on_attach(function(client, bufnr)
    local bind = vim.keymap.set
    local opts = {
        buffer = bufnr,
        remap = false,
    }

    bind('n', 'gd', vim.lsp.buf.definition, opts)
    bind('n', 'gD', vim.lsp.buf.declaration, opts)
    bind('n', 'gi', vim.lsp.buf.implementation, opts)
    bind('n', 'go', vim.lsp.buf.type_definition, opts)
    bind('n', 'gr', vim.lsp.buf.references, opts)
    bind('n', '<leader>rr', vim.lsp.buf.rename, opts)
    bind('n', '<leader>ro', vim.lsp.buf.code_action, opts)
    bind('n', 'K', vim.lsp.buf.hover, opts)
    bind('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    bind({'n', 'v'}, '<leader>rf', vim.lsp.buf.format, opts)

    -- Enable completion triggered by <c-x><c-o>
    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
end)

--vim.api.nvim_create_autocmd('LspAttach', {
--    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--    callback = function(ev)
--        local opts = { buffer = ev.buf, remap = false }
--
--        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--        vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
--        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--        vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, opts)
--        vim.keymap.set('n', '<leader>ro', vim.lsp.buf.code_action, opts)
--        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
--        vim.keymap.set({'n', 'v'}, '<leader>rf', vim.lsp.buf.format, opts)
--
--        -- Enable completion triggered by <c-x><c-o>
--        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
--    end,
--})

--local cmp = require('cmp')
--local cmp_mappings = lsp.defaults.cmp_mappings({
--    ['<Tab>'] = cmp.mapping.confirm(),
--    ['<leader>c'] = cmp.mapping.abort(),
--})
--
--cmp_mappings['<S-Tab>'] = nil
--cmp_mappings['<CR>'] = nil
--cmp_mappings['<C-e>'] = nil
--
--lsp.setup_nvim_cmp({
--    mapping = cmp_mappings
--})

-- Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

local cmp = require('cmp')

cmp.setup{
    completion = { autocomplete = false },
    mapping = {
        ['<Tab>'] = cmp.mapping.confirm({select = false}),
    }
}
