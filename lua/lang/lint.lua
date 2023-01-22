local lint = require('lint')

lint.linters_by_ft = {
    typescript = { 'eslint_d' },
}

vim.api.nvim_create_autocmd({'BufWritePost'}, {
    callback = function()
        require('lint').try_lint()
    end,
})