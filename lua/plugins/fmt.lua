return {
    {
        "stevearc/conform.nvim",
        ---@module "conform"
        ---@type conform.setupOpts
        opts = {
            default_format_opts = {
                timeout_ms = 7000,
                lsp_fallback = "fallback",
                async = true,
            },
            formatters_by_ft = {
                xml = { "xmlformat" },
                cs = { "csharpier" },
                lua = { "stylua" },
                fsharp = { "fantomas" },
                markdown = { "markdownlint-cli2" },
            },
        },
        keys = {
            {
                "<leader>gq",
                function()
                    require("conform").format()
                end,
                mode = { "n", "v" },
            },
        },
        ft = { "cs", "lua", "xml", "fs" },
        cmd = { "ConformInfo" },
    },
}
