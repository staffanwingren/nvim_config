return {
  'mfussenegger/nvim-lint',
  config = function()
    local lint = require 'lint'
    lint.liters_by_ft = {
      typescript = { 'eslint' },
    }
    vim.api.nvim_create_autocmd({
      "BufWritePost"
    }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
