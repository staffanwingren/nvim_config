return {
    'nvim-lualine/lualine.nvim',
    opts = {
        -- options = { theme = Theme },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch' },
            lualine_c = { 'filename' },
            lualine_x = { 'diff' },
            lualine_y = { 'encoding' },
            lualine_z = { 'location', 'progress' },
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
        extensions = { 'quickfix' }
    }
}
