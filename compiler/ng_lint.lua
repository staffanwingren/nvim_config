vim.g.current_compiler = 'ng_lint'
vim.cmd([[
    CompilerSet errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %trror\ -\ %m,%-G%.%#
    CompilerSet makeprg=ng\ lint\ --format=compact\ --silent
]])
