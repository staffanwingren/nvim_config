vim.g.current_compiler = 'ng_build'
vim.cmd([[
    CompilerSet errorformat=%.%#:\ %f:%l:%c\ -\ %t%\\w%\\+\ %\\w%#:\ %m,%\\s%#%f:%l:%c,%-G%.%#
    CompilerSet makeprg=ng\ build\ --progress=false\ --verbose=false
]])
