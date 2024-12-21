return {
    {
        "williamboman/mason.nvim",
        enabled = false,
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
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "Issafalcon/lsp-overloads.nvim",
            "Hoffs/omnisharp-extended-lsp.nvim",
        },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lspconfig = require('lspconfig')

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    local opts = { buffer = args.bufnr, remap = false, silent = true }
                    if client and client.supports_method('textDocument/definition') then
                        --vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    end
                    if client and client.supports_method('textDocument/declaration') then
                        --vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    end
                    if client and client.supports_method('textDocument/implementation') then
                        vim.keymap.set("n", "gri", vim.lsp.buf.implementation, opts)
                    end
                    if client and client.supports_method('textDocument/typeDefinition') then
                        --vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
                    end
                    if client and client.supports_method('textDocument/references') then
                        vim.keymap.set("n", "grr", vim.lsp.buf.references, opts)
                    end
                    if client and client.supports_method('textDocument/rename') then
                        vim.keymap.set("n", "grn", vim.lsp.buf.rename, opts)
                    end
                    if client and client.supports_method('textDocument/codeAction') then
                        vim.keymap.set({"n", "v"}, "gra", vim.lsp.buf.code_action, opts)
                    end
                    if client and client.supports_method('textDocument/documentSymbol') then
                        vim.keymap.set("n", "gO", vim.lsp.buf.document_symbol, opts)
                    end
                    if client and client.supports_method('textDocument/signatureHelp') then
                        vim.keymap.set("i", "<CTRL-S>", vim.lsp.buf.signature_help, opts)
                    end
                    --vim.keymap.set("i", "<M-k>", "<Esc>:LspOverloadsSignature<CR>a", opts)
                    --vim.keymap.set("n", "<M-k>", ":LspOverloadsSignature<CR>", opts)
                end,
            })

            local omnisharp_dll = os.getenv("OMNISHARP_DLL")
            lspconfig["omnisharp"].setup {
                cmd = { "dotnet", omnisharp_dll },
                handlers = {
                    ["textDocument/definition"] = require("omnisharp_extended").handler,
                },
                settings = {
                    FormattingOptions = {
                        -- Enables support for reading code style, naming convention and analyzer
                        -- settings from .editorconfig.
                        EnableEditorConfigSupport = true,
                        -- Specifies whether 'using' directives should be grouped and sorted during
                        -- document formatting.
                        OrganizeImports = true,
                    },
                    MsBuild = {
                        -- If true, MSBuild project system will only load projects for files that
                        -- were opened in the editor. This setting is useful for big C# codebases
                        -- and allows for faster initialization of code navigation features only
                        -- for projects that are relevant to code that is being edited. With this
                        -- setting enabled OmniSharp may load fewer projects and may thus display
                        -- incomplete reference lists for symbols.
                        LoadProjectsOnDemand = nil,
                    },
                    RoslynExtensionsOptions = {
                        -- Enables support for roslyn analyzers, code fixes and rulesets.
                        EnableAnalyzersSupport = true,
                        -- Enables support for showing unimported types and unimported extension
                        -- methods in completion lists. When committed, the appropriate using
                        -- directive will be added at the top of the current file. This option can
                        -- have a negative impact on initial completion responsiveness,
                        -- particularly for the first few completion sessions after opening a
                        -- solution.
                        EnableImportCompletion = true,
                        -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
                        -- true
                        AnalyzeOpenDocumentsOnly = false,
                    },
                    Sdk = {
                        -- Specifies whether to include preview versions of the .NET SDK when
                        -- determining which version to use for project loading.
                        IncludePrereleases = true,
                    },
                },
            }

            if vim.fn.executable('lua-language-server') == 1 then
                lspconfig["lua_ls"].setup{}
            end

            if vim.fn.executable('marksman') == 1 then
                lspconfig['marksman'].setup{}
            end
        end,
    }
}
