return {
    {
        "hrsh7th/nvim-cmp",
        enabled = false,
        version = false, -- last release is way too old
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            {
                "L3MON4D3/LuaSnip",
                keys = {
                    {
                        "<tab>",
                        function()
                            return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
                        end,
                        expr = true,
                        silent = true,
                        mode = "i",
                    },
                    {
                        "<tab>",
                        function()
                            require("luasnip").jump(1)
                        end,
                        mode = "s",
                    },
                    {
                        "<s-tab>",
                        function()
                            require("luasnip").jump(-1)
                        end,
                        mode = { "i", "s" },
                    },
                },
            },
            "rafamadriz/friendly-snippets",
            "saadparwaiz1/cmp_luasnip",
        },
        opts = function()
            local cmp = require "cmp"
            local defaults = require "cmp.config.default"()
            return {
                completion = {
                    completeopt = "menu,menuone,noinsert",
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert {
                    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
                    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<M-CR>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Insert },
                },
                preselect = cmp.PreselectMode.None,
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" },
                    --{ name = "copilot" },
                }, {
                    { name = "buffer" },
                }),
                sorting = defaults.sorting,
            }
        end,
        config = function(_, opts)
            for _, source in ipairs(opts.sources) do
                source.group_index = source.group_index or 1
            end
            require("luasnip.loaders.from_vscode").lazy_load()
            require("cmp").setup(opts)
        end,
    },
    {
        "echasnovski/mini.completion",
        version = "*",
        config = function()
            require("mini.completion").setup()
        end,
    },
}
