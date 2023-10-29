-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = " "

vim.g.netrw_menu = 0
vim.g.netrw_banner = 0
vim.g.netrw_preview = 1
vim.g.netrw_liststyle = 0
vim.g.netrw_winsize = 25
vim.g.netrw_bufsettings = "noma nomod nu nowrap ro nobl"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 6
vim.opt.list = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.textwidth = 80

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "81"

vim.opt.path:append("**")

vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"

vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
