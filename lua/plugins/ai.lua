return {
    {
        "zbirenbaum/copilot.lua",
        enabled = true,
        event = "InsertEnter",
        config = function()
            require("copilot").setup{}
        end,
        --opts = {
        --    suggestion = { enabled = false },
        --    panel = { enabled = false },
        --},
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "zbirenbaum/copilot.lua" },
            { "nvim-lua/plenary.nvim" },
        },
        opts = {},
    },
}
