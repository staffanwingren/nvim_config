local cs = "gruvbox"

return {
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 950,
        enabled = cs == "gruvbox",
        config = function()
            if cs == "gruvbox" then
                vim.opt.background = "dark"
                vim.cmd "colorscheme gruvbox"
            end
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 950,
        enabled = cs == "tokyonight",
        config = function()
            if cs == "tokyonight" then
                vim.opt.background = "dark"
                vim.cmd "colorscheme tokyonight"
            end
        end,
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 950,
        enabled = cs == "kanagawa",
        config = function()
            if cs == "kanagawa" then
                vim.opt.background = "dark"
                vim.cmd "colorscheme kanagawa"
            end
        end,
    },
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 950,
        enabled = cs == "catppuccin",
        name = "catppuccin",
        config = function()
            if cs == "catppuccin" then
                vim.opt.background = "dark"
                vim.cmd.colorscheme "catppuccin"
            end
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = { theme = cs },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = { "filename" },
                lualine_x = { "diff" },
                lualine_y = { "encoding" },
                lualine_z = { "location", "progress" },
            },
            --    inactive_sections = {},
            tabline = {
                lualine_a = {
                    {
                        "tabs",
                        mode = 2,
                    },
                },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            --    winbar = {},
            --    inactive_winbar = {},
            extensions = { "quickfix" },
        },
    },
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        config = function()
            local header = [[

██████╗ ██████╗ ██╗   ██╗██    ██╗ █████╗ ██╗  ██╗   ██╗████████╗
██╔══██╗██╔══██╗██║   ██║██    ██║██╔══██╗███╗ ██║   ██║╚══██╔══╝
██║  ██║██████╔╝██║   ██║╚██  ██╔╝███████║██║█╗██║   ██║   ██║   
██║  ██║██╔══██╗██║   ██║ ██  ██║ ██╔══██║██║ ███║   ██║   ██║   
██████╔╝██║  ██║╚██████╔╝ ╚████╔╝ ██║  ██║██║  ██║██╗██║   ██║   
╚═════╝ ╚═╝  ╚═╝ ╚═════╝   ╚═══╝  ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═╝   ╚═╝   

      ]]

            require("dashboard").setup {
                theme = "doom", --  theme is doom and hyper default is hyper
                disable_move = false, --  default is false disable move keymap for hyper
                shortcut_type = "letter", --  shorcut type 'letter' or 'number'
                change_to_vcs_root = true, -- default is false,for open file in hyper mru. it will change to the root of vcs
                config = { --  config used for theme
                    header = vim.split(header, "\n"),
                    center = {
                        {
                            icon = "󰎔  ",
                            icon_hl = "group",
                            desc = "New File",
                            desc_hl = "group",
                            key = "n",
                            key_hl = "group",
                            key_format = " [%s]",
                            action = "enew",
                        },
                        {
                            icon = "  ",
                            icon_hl = "group",
                            desc = "Recent projects...",
                            desc_hl = "group",
                            key = "p",
                            key_hl = "group",
                            key_format = " [%s]",
                            action = "Telescope projects",
                        },
                        {
                            icon = "  ",
                            icon_hl = "group",
                            desc = "Last session...",
                            desc_hl = "group",
                            key = "s",
                            key_hl = "group",
                            key_format = " [%s]",
                            action = "lua require 'persistence'.load{ last = true }",
                        },
                        {
                            icon = "  ",
                            icon_hl = "group",
                            desc = "Recent files...",
                            desc_hl = "group",
                            key = "r",
                            key_hl = "group",
                            key_format = " [%s]",
                            action = "Telescope oldfiles",
                        },
                        {
                            icon = "  ",
                            icon_hl = "group",
                            desc = "Quit",
                            desc_hl = "group",
                            key = "q",
                            key_hl = "group",
                            key_format = " [%s]",
                            action = "qa",
                        },
                    },
                },
                --hide = {
                --  statusline = true, -- hide statusline default is true
                --  tabline = true,  -- hide the tabline
                --  winbar = true,   -- hide winbar
                --},
            }
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "folke/persistence.nvim",
        },
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require "notify"
        end,
    },
    {
        "folke/which-key.nvim",
        config = function(_, _)
            vim.g.mapleader = " "

            local wk = require "which-key"

            wk.register {
                ["<Leader>b"] = { name = "Buffer..." },
                ["<Leader>k"] = { name = "Quickmaps..." },
                ["<Leader>r"] = { name = "Refactor..." },
                ["<Leader>s"] = { name = "Debug..." },
                ["<Leader>t"] = { name = "Telescope..." },
            }
        end,
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        opts = {
            -- add any custom options here
        },
    },
}
