-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<Leader>bb", ":buffers<CR>:buffer<Space>", { desc = "Buffer select" })
vim.keymap.set("n", "<Leader>bd", ":buffers<CR>:bdelete<Space>", { desc = "Buffer delete select" })
vim.keymap.set("n", "[b", ":bprevious<CR>", { desc = "Buffer previous" })
vim.keymap.set("n", "]b", ":bnext<CR>", { desc = "Buffer next" })
vim.keymap.set("n", "]q", ":cnext<CR>", { desc = "Quicklist next" })
vim.keymap.set("n", "]Q", ":clast<CR>", { desc = "Quicklist last" })
vim.keymap.set("n", "[q", ":cprevious<CR>", { desc = "Quicklist previous" })
vim.keymap.set("n", "[Q", ":cfirst<CR>", { desc = "Quicklist first" })
vim.keymap.set("n", "]l", ":lnext<CR>", { desc = "Locallist next" })
vim.keymap.set("n", "]L", ":llast<CR>", { desc = "Locallist last" })
vim.keymap.set("n", "[l", ":lprevious<CR>", { desc = "Locallist previous" })
vim.keymap.set("n", "[L", ":lfirst<CR>", { desc = "Locallist first" })
vim.keymap.set("n", "]a", ":next<CR>", { desc = "Argumentlist next" })
vim.keymap.set("n", "]A", ":last<CR>", { desc = "Argumentlist last" })
vim.keymap.set("n", "[a", ":previous<CR>", { desc = "Argumentlist previous" })
vim.keymap.set("n", "[A", ":first<CR>", { desc = "Argumentlist first" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Diagnostics open" })
vim.keymap.set("n", "<leader>D", vim.diagnostic.setloclist, { desc = "Diagnostics populate locallist" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Diagnostics previous" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Diagnostics next" })
