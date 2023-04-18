local colorScheme = 'gruvbox'
local ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorScheme)

if not ok then
    vim.notify('colorscheme ' .. colorScheme .. ' not found')
    return
end

vim.opt.background = 'dark'

require('lualine').setup{
    options = { theme = colorScheme },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {'diff'},
        lualine_y = {'encoding'},
        lualine_z = {'location'},
    },
--    inactive_sections = {},
    tabline = {
        lualine_a = {
            {
                'tabs',
                mode = 2,
            }
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
--    winbar = {},
--    inactive_winbar = {},
    extensions = {'quickfix'}
}
