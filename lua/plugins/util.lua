return {
    "tpope/vim-sleuth",
    "tpope/vim-surround",
    "tpope/vim-repeat",
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
    {
        "nvim-neotest/nvim-nio",
        lazy = true,
    },
    {
        "nvim-lua/plenary.nvim",
        lazy = true,
    },
    {
        "antoinemadec/FixCursorHold.nvim",
        lazy = true,
    },
    {
        "echasnovski/mini.ai",
        version = "*",
        enabled = false,
        config = function()
            require("mini.ai").setup()
        end,
    },
}
