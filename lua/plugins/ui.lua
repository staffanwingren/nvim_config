local cs = 'gruvbox'

return {
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 950,
    config = function()
      if cs == 'gruvbox' then
        vim.opt.background = 'dark'
        vim.cmd('colorscheme gruvbox')
      end
    end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 950,
    enabled = false,
    config = function()
      if cs == 'tokyonight' then
        vim.opt.background = 'dark'
        vim.cmd('colorscheme tokyonight')
      end
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = { theme = cs },
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
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'hyper',           --  theme is doom and hyper default is hyper
        disable_move = false,      --  default is false disable move keymap for hyper
        shortcut_type = 'letter',  --  shorcut type 'letter' or 'number'
        change_to_vcs_root = true, -- default is false,for open file in hyper mru. it will change to the root of vcs
        config = {},               --  config used for theme
        --hide = {
        --  statusline = true, -- hide statusline default is true
        --  tabline = true,  -- hide the tabline
        --  winbar = true,   -- hide winbar
        --},
      }
    end,
    dependencies = { 'vim-tree/nvim-web-devicons' }
  },
}
