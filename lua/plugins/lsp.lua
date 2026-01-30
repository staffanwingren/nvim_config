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
            local omnisharp_dll = os.getenv("OMNISHARP_DLL")
            if omnisharp_dll then
                local pid = vim.fn.getpid()
                vim.lsp.config('omnisharp', {
                    cmd = { "dotnet", omnisharp_dll, "-z", "--hostPID", pid, "DotNet:enablePackageRestore=false", "--encoding", "utf-8", "--languageserver" },
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
                })
                vim.lsp.enable('omnisharp')
            end

            --if vim.fn.executable('fsautocomplete') == 1 then
            --    vim.lsp.enable('fsautocomplete')
            --end

            local bicep_dll = os.getenv("BICEP_LANGSRV_DLL")
            if bicep_dll ~= nil and bicep_dll ~= '' then
                vim.lsp.config('bicep', {
                    cmd = { "dotnet", bicep_dll };
                })
                vim.lsp.enable('bicep')
            end

            if vim.fn.executable('lua-language-server') == 1 then
                vim.lsp.enable('lua_ls')
            end

            if vim.fn.executable('marksman') == 1 then
                vim.lsp.enable('marksman')
            end

            if vim.fn.executable('gopls') == 1 then
                vim.lsp.enable('gopls')
            end

            if vim.fn.executable('typescript-language-server') == 1 then
                vim.lsp.enable('ts_ls')
            end
        end,
    },
    {
        "ionide/Ionide-vim",
        enabled = true,
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        ft = { "fsharp" },
    }
}
