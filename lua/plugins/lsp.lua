return {
    {
        'williamboman/mason.nvim',
        opts = {},
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'Issafalcon/lsp-overloads.nvim',
            'Hoffs/omnisharp-extended-lsp.nvim',
        },
        config = function()
            local lspconfig = require 'lspconfig'
            local mason_pac = vim.fn.stdpath("data") .. "/mason/packages/"
            local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/"

            local on_attach = function(client, bufnr)
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

                vim.keymap.set(
                    'i',
                    '<M-k>',
                    '<Esc>:LspOverloadsSignature<CR>a',
                    opts
                )
                vim.keymap.set(
                    'n',
                    '<M-k>',
                    ':LspOverloadsSignature<CR>',
                    opts
                )

                if client.server_capabilities.signatureHelpProvider then
                    require('lsp-overloads').setup(client, {
                        keymaps = {
                            next_signature = "<C-j>",
                            previous_signature = "<C-k>",
                            next_parameter = "<C-l>",
                            previous_parameter = "<C-h>",
                            close_signature = "<A-k>"
                        },
                        display_automatically = false,
                    })
                end
            end

            local lsp_setup = function(lsp_name, opts)
                opts = opts or {}
                local default_opts = {
                    cmd = { mason_bin .. lsp_name .. '.cmd' },
                    on_attach = on_attach,
                }

                for k, v in pairs(opts) do
                    default_opts[k] = v
                end

                lspconfig[lsp_name].setup(default_opts)
            end

            lsp_setup(
                "omnisharp",
                {
                    handlers = {
                        ["textDocument/definition"] = require('omnisharp_extended').handler,
                    },
                    enable_editorconfig_support = true,
                    enable_roslyn_analysers = true,
                    organize_imports_on_format = true,
                    enable_import_completion = true,
                    sdk_include_prereleases = true,
                    analyze_open_documents_only = false,
                    enable_ms_build_load_projects_on_demand = false,
                }
            )

            lsp_setup("gopls")
            lsp_setup("tsserver", {
                cmd = {
                    mason_bin .. 'typescript-language-server.cmd',
                    '--stdio',
                },
            })

            lsp_setup("svelte", {
                cmd = {
                    mason_bin .. 'svelteserver.cmd',
                    '--stdio',
                }
            })

            lsp_setup("bicep", {
                cmd = {
                    mason_bin .. 'bicep-lsp.cmd'
                },
            })

            lsp_setup("powershell_es", {
                cmd = {},
                bundle_path = mason_pac .. 'powershell-editor-services/PowerShellEditorServices',
            })

--            lsp_setup("vale_ls", {
--                cmd = { mason_bin .. 'vale-ls.cmd' },
--                root_dir = require 'lspconfig.util'.root_pattern { 'vale.ini', '.obsidian', '.attachments' },
--                single_file_support = true,
--            })

            lsp_setup("lua_ls", {
                cmd = {
                    mason_bin .. 'lua-language-server.cmd',
                },
                on_init = function(client)
                    local path = client.workspace_folders[1].name
                    if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                        client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                            Lua = {
                                runtime = {
                                    -- Tell the language server which version of Lua you're using
                                    -- (most likely LuaJIT in the case of Neovim)
                                    version = 'LuaJIT'
                                },
                                -- Make the server aware of Neovim runtime files
                                workspace = {
                                    checkThirdParty = false,
                                    library = {
                                        vim.env.VIMRUNTIME
                                        -- "${3rd}/luv/library"
                                        -- "${3rd}/busted/library",
                                    }
                                    -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                                    -- library = vim.api.nvim_get_runtime_file("", true)
                                }
                            }
                        })

                        client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
                    end

                    return true
                end
            })
        end
    },
}
