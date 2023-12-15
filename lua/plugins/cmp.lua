return {
    'hrsh7th/nvim-cmp',
    enabled = true,
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'L3MON4D3/LuaSnip',
    },
    config = function()
        local cmp = require'cmp'
        local luasnip = require'luasnip'
        local vscode_loaders = require'luasnip.loaders.from_vscode'

        vscode_loaders.load()

        -- Setup nvim-cmp
        cmp.setup {
            snippet = {
                expand = function(args)
                    luasnip.expand(args.body)
                end
            },
            sources = cmp.config.sources{
                { name = 'path' },
                { name = 'nvim_lsp' },
                { name = 'luasnip', keyword_length = 2 },
                { name = 'buffer', keyword_length = 3 },
            },
            window = {},
            mapping = cmp.mapping.preset,
        }

        -- Setup LuaSnip key bindings
--        vim.keymap.set({'i', 's'}, '<C-n>', function()
--            if luasnip.jumpable(1) then
--                luasnip.jump(1)
--            end
--        end, { silent = true })
--        vim.keymap.set({'i', 's'}, '<C-p>', function()
--            if luasnip.jumpable(-1) then
--                luasnip.jump(-1)
--            end
--        end, { silent = true })
        --vim.keymap.set({'i', 's'}, '<C-l>', function()
        --    if luasnip.choice_active() then
        --        luasnip.change_choice(1)
        --    end
        --end, { silent = true })
    end,

}
