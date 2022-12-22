local colorScheme = 'gruvbox'
local ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorScheme)
vim.o.background = 'dark'
if not ok then
    vim.notify('colorscheme ' .. colorScheme .. ' not found')
    return
end

vim.opt.number = true
vim.opt.numberwidth = 6
vim.opt.list = true
