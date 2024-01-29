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
            local mason_pack_dir = vim.fn.stdpath("data") .. "/mason/packages"
            local install_dir = vim.fn.stdpath("data") .. "/mason/bin"
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

                    if client.server_capabilities.signatureHelpProvider then
                        require('lsp-overloads').setup(client, {})
                    end
            end

            local omnisharp_cmd = install_dir .. '/omnisharp.cmd'
            lspconfig.omnisharp.setup {
                cmd = {
                    omnisharp_cmd,
                },
                filetypes = { "cs", "vb" },
                on_attach = on_attach,
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

            lspconfig.gopls.setup{
                cmd = {
                    install_dir .. '/gopls.cmd',
                }
            }
            lspconfig.tsserver.setup{
                cmd = {
                    install_dir .. '/typescript-language-server.cmd',
                    '--stdio',
                },
            }
            lspconfig.bicep.setup{
                cmd = {
                    install_dir .. '/bicep-lsp.cmd'
                },
            }
            lspconfig.lua_ls.setup {
                cmd = {
                    install_dir .. '/lua-language-server.cmd',
                },
                on_init = function(client)
                  local path = client.workspace_folders[1].name
                  if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
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
            }
            lspconfig.powershell_es.setup{
                bundle_path = '/powershell-editor-services/PowerShellEditorServices'
            }
        end
    },
}
