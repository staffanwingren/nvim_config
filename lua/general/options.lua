vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 8
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.signcolumn = 'yes'

-- dotnet build error format
-- errorformat+=%f(%l,%c):\ %t%\\w%\\+\ %m\ [%.%#
vim.opt.errorformat:append('%f(%l\\,%c): %t%\\w%\\+ %m [%.%#')
