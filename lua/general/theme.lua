local theme = 'gruvbox'
local has_theme, _ = pcall(vim.cmd, 'colorscheme ' .. theme)

if not has_theme then
    vim.notify('colorscheme ' .. theme .. ' not found')
end

vim.opt.background = 'dark'

local has_lualine, lualine = pcall(require, 'lualine')
if has_lualine then
    lualine.setup{
        options = { theme = theme },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch'},
            lualine_c = {'filename'},
            lualine_x = {'diff'},
            lualine_y = {'encoding'},
            lualine_z = {'location', 'progress'},
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
else
    vim.notify('Configuration: lualine is not available')
end
