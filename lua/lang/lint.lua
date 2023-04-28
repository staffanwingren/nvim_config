local ok, null_ls = pcall(require, 'null-ls')

if not ok then
    print('Configuration: null-ls not available')
    return
end

null_ls.setup({
    debug = true,
    sources = {
        null_ls.builtins.diagnostics.eslint.with({
            method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
            timeout = 30000,
        }),
        null_ls.builtins.formatting.eslint.with({
            timeout = 15000,
        }),
        null_ls.builtins.code_actions.eslint.with({
            timeout = 15000,
        }),
    },
})
