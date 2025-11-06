return {
    {
        "zbirenbaum/copilot.lua",
        enabled = true,
        event = "InsertEnter",
        config = function()
            require("copilot").setup{
                auth_provider_url = "https://uppsala-monitoring-centre.ghe.com/",
                suggestion = { enabled = false },
                --panel = { enabled = false },
            }
        end,
    },
    {
        dir = "~/repos/private/copilotchat.nvim",
        --"CopilotC-Nvim/CopilotChat.nvim",
        enabled = true,
        dependencies = {
            { "zbirenbaum/copilot.lua" },
            { "nvim-lua/plenary.nvim" },
        },
        opts = {
            -- default selection
            --selection = function(source)
            --    local select = require('CopilotChat.select')
            --    return select.visual(source) or ""
            --end
        },
        config = function(_, opts)
            local copilot = require('CopilotChat')
            copilot.setup(opts)
        end,
        --cmd = {
        --    "CopilotChatToggle",
        --    "CopilotChatCommit",
        --    "CopilotChatExplain",
        --    "CopilotChatDocs",
        --    "CopilotChatFix",
        --    "CopilotChatReview",
        --    "CopilotChatLoad",
        --},
        --keys = {
        --    { "<leader>it", "<cmd>CopilotChatToggle<CR>", { "n", "v" }, desc = "CopilotChat Toggle" },
        --    { "<leader>ig", "<cmd>CopilotChatCommit<CR>", { "n", "v" }, desc = "CopilotChat Commit Msg" },
        --    { "<leader>ie", "<cmd>CopilotChatExplain<CR>", { "n", "v" }, desc = "CopilotChat Explain" },
        --    { "<leader>id", "<cmd>CopilotChatDocs<CR>", { "n", "v" }, desc = "CopilotChat Document Code" },
        --    { "<leader>if", "<cmd>CopilotChatFix<CR>", { "n", "v" }, desc = "CopilotChat Suggest Fixes" },
        --    { "<leader>ir", "<cmd>CopilotChatReview<CR>", { "n", "v" }, desc = "CopilotChat Review" },
        --    { "<leader>is", "<cmd>CopilotChatSave ", { "n", "v" }, desc = "CopilotChat Save Chat" },
        --    { "<leader>ip", "<cmd>CopilotChatLoad ", { "n", "v" }, desc = "CopilotChat Load Chat" },
        --},
    },
}
