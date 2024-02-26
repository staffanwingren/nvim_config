vim.api.nvim_create_user_command('Trim', ':%s/\\s\\+$//g', { desc = 'Trim trailing spaces in buffer' })
