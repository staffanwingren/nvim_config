return {
    {
        "williamboman/mason.nvim",
        cmd = {
            "Mason",
            "MasonInstall",
            "MasonUninstall",
            "MasonUninstallAll",
            "MasonLog",
            "MasonUpdate",
        },
        lazy = true,
        opts = {},
    },
    {
        "folke/neodev.nvim",
        lazy = true,
        opts = {}
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "Issafalcon/lsp-overloads.nvim",
            "Hoffs/omnisharp-extended-lsp.nvim",
            "folke/neodev.nvim",
        },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local cmd_ext = vim.loop.os_uname().sysname == "Windows_NT" and ".cmd" or ""
            local lspconfig = require "lspconfig"
            local mason_pac = vim.fn.stdpath "data" .. "/mason/packages/"
            local mason_bin = vim.fn.stdpath "data" .. "/mason/bin/"

            local on_attach = function(client, bufnr)
                local opts = { buffer = bufnr, remap = false, silent = true }

                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>R", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>r", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>gq", vim.lsp.buf.format, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

                --vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')
                --vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
                --vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")

                vim.keymap.set("i", "<M-k>", "<Esc>:LspOverloadsSignature<CR>a", opts)
                vim.keymap.set("n", "<M-k>", ":LspOverloadsSignature<CR>", opts)

                if client.server_capabilities.signatureHelpProvider then
                    require("lsp-overloads").setup(client, {
                        keymaps = {
                            next_signature = "<C-j>",
                            previous_signature = "<C-k>",
                            next_parameter = "<C-l>",
                            previous_parameter = "<C-h>",
                            close_signature = "<A-k>",
                        },
                        display_automatically = false,
                    })
                end
            end

            lspconfig["omnisharp"].setup {
                cmd = { mason_bin .. "omnisharp" .. cmd_ext },
                on_attach = on_attach,
                handlers = {
                    ["textDocument/definition"] = require("omnisharp_extended").handler,
                },
                filetypes = {
                    "cs",
                    "vb",
                    "cshtml",
                    "razor",
                },
                enable_editorconfig_support = true,
                enable_roslyn_analysers = true,
                organize_imports_on_format = true,
                enable_import_completion = true,
                sdk_include_prereleases = true,
                analyze_open_documents_only = false,
                enable_ms_build_load_projects_on_demand = false,
            }

            lspconfig["gopls"].setup {
                cmd = { mason_bin .. "gopls" .. cmd_ext },
                on_attach = on_attach,
            }

            lspconfig["tsserver"].setup {
                cmd = {
                    mason_bin .. "typescript-language-server" .. cmd_ext,
                    "--stdio",
                },
                on_attach = on_attach,
            }

            lspconfig["bicep"].setup {
                cmd = {
                    mason_bin .. "bicep-lsp" .. cmd_ext,
                },
                on_attach = on_attach,
            }

            lspconfig["powershell_es"].setup {
                bundle_path = mason_pac .. "powershell-editor-services/PowerShellEditorServices",
                on_attach = on_attach,
            }

            lspconfig["lua_ls"].setup {
                cmd = {
                    mason_bin .. "lua-language-server" .. cmd_ext,
                },
                on_attach = on_attach,
            }
        end,
    },
}
