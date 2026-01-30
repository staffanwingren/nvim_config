vim.keymap.set('n', 'gd', function() require('omnisharp_extended').lsp_definition() end, { buffer = 0, desc = "Ext: Go to definition" })
vim.keymap.set('n', 'grt', function() require('omnisharp_extended').lsp_type_definition() end, { buffer = 0, desc = "Ext: Type definition" })
vim.keymap.set('n', 'grr', function() require('omnisharp_extended').lsp_references() end, { buffer = 0, desc = "Ext: Find references" })
vim.keymap.set('n', 'gri', function() require('omnisharp_extended').lsp_implementation() end, { buffer = 0, desc = "Ext: Go to implementation" })
