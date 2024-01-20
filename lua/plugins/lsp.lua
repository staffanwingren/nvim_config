return {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'Hoffs/omnisharp-extended-lsp.nvim',
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'neovim/nvim-lspconfig',
        },
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.on_attach(function(_, bufnr)
                local opts = { buffer = bufnr, remap = false, silent = true }

                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<leader>R', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<leader>r', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', '<leader>gq', vim.lsp.buf.format, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

                vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
                vim.api.nvim_buf_set_option(bufnr, 'tagfunc', 'v:lua.vim.lsp.tagfunc')
            end)

            require('mason').setup {}
            require('mason-lspconfig').setup {
                ensure_installed = {
                    'gopls',
                    'lua_ls',
                    'tsserver',
                    'omnisharp',
                    'bicep',
                    'powershell_es'
                },
                handlers = {
                    lsp_zero.default_setup,
                    omnisharp = function()
                        local install_dir = vim.fn.stdpath("data") .. "/mason/packages"
                        local omnisharp_cmd = install_dir .. '/omnisharp/omnisharp.cmd'
                        local config = {
                            cmd = {
                                omnisharp_cmd,
                                '--languageserver',
                                '--hostPID', tostring(vim.fn.getpid())
                            },
                            filetypes = { 'cs' },
                            root_dir = require('lspconfig').util.root_pattern(
                                '*.sln',
                                '*.csproj',
                                '*.props',
                                '*.targets',
                                'packages.config'
                            ),
                            enable_editorconfig_support = true,
                            enable_roslyn_analysers = true,
                            enable_import_completion = true,
                            sdk_include_prereleases = true,
                            analyze_open_documents_only = false,
                            enable_ms_build_load_projects_on_demand = false,
                            handlers = {
                                ['textDocument/definition'] = require('omnisharp_extended').handler,
                            }
                        }
                        require('lspconfig').omnisharp.setup(config)
                    end,
                }
            }
        end,
    },
}
