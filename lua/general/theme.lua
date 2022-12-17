local colorScheme = 'gruvbox'
local ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorScheme)
vim.o.background = 'dark'
if not ok then
    vim.notify('colorscheme ' .. colorScheme .. ' not found')
    return
end

vim.opt.number = true
vim.opt.numberwidth = 6
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.list = true
