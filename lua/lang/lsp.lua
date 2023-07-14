local ok, lsp = pcall(require, 'lsp-zero')

if not ok then
    print('Configuration: lsp-zero not available')
    return
end

vim.g.OmniSharp_server_use_net6 = 1
lsp.preset({})

-- Configure buffer to use LSP
lsp.on_attach(function (_, bufnr)

    local opts = { buffer = bufnr, remap = false, silent = true }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>R', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>r', vim.lsp.buf.code_action, opts)
    vim.keymap.set({'n', 'v'}, '<leader>rf', vim.lsp.buf.format, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

    vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.api.nvim_buf_set_option(bufnr, 'tagfunc', 'v:lua.vim.lsp.tagfunc')
end)

-- Configure lua language server for neovim
lsp.nvim_workspace()

-- Setup lsp-zero
lsp.setup()

-- Completion configuration
local has_cmp, cmp = pcall(require, 'cmp')
local has_luasnip, luasnip = pcall(require, 'luasnip')
local has_vscode_loaders, vscode_loaders = pcall(require, 'luasnip.loaders.from_vscode')
if has_cmp and has_luasnip and has_vscode_loaders then
    vscode_loaders.load()

    -- Setup nvim-cmp
    cmp.setup {
        snippet = {
            expand = function(args)
                luasnip.expand(args.body)
            end
        },
        sources = {
            { name = 'path' },
            { name = 'nvim_lsp' },
            { name = 'luasnip', keyword_length = 2 },
            { name = 'buffer', keyword_length = 3 },
        },
        mapping = {
            ['<Tab>'] = cmp.mapping.confirm(),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-n>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<C-p>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                else
                    fallback()
                end
            end, { 'i', 's' }),
        },
        preselect = 'item',
        completion = {
            completeopt = 'menu,menuone,noinsert',
        },
    }

    -- Setup LuaSnip key bindings
    vim.keymap.set({'i', 's'}, '<C-k>', function()
        if luasnip.jumpable(1) then
            luasnip.jump(1)
        end
    end, { silent = true })
    vim.keymap.set({'i', 's'}, '<C-j>', function()
        if luasnip.jumpable(-1) then
            luasnip.jump(-1)
        end
    end, { silent = true })
    vim.keymap.set({'i', 's'}, '<C-l>', function()
        if luasnip.choice_active() then
            luasnip.change_choice(1)
        end
    end, { silent = true })
else
    print('Configuration: cmp could not be configured')
end

