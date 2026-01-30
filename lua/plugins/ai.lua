return {
    {
        "zbirenbaum/copilot.lua",
        enabled = false,
        config = function()
            require("copilot").setup{
                auth_provider_url = "https://uppsala-monitoring-centre.ghe.com",
                suggestion = { enabled = false },
                panel = { enabled = false },
            }
        end,
    },
    {
        dir = os.getenv("COPILOTCHATNVIM_DIR") or "~/repos/private/copilotchat.nvim",
        --"CopilotC-Nvim/CopilotChat.nvim",
        enabled = true,
        dependencies = {
            { "nvim-lua/plenary.nvim" },
        },
        config = function(_, opts)
            local copilot = require('CopilotChat')
            copilot.setup(opts)
        end,
        cmd = {
            "CopilotChatToggle",
            "CopilotChatCommit",
            "CopilotChatExplain",
            "CopilotChatDocs",
            "CopilotChatFix",
            "CopilotChatReview",
            "CopilotChatLoad",
        },
        keys = {
            { "<leader>it", "<cmd>CopilotChatToggle<CR>", { "n", "v" }, desc = "CopilotChat Toggle" },
            { "<leader>ig", "<cmd>CopilotChatCommit<CR>", { "n", "v" }, desc = "CopilotChat Commit Msg" },
            { "<leader>ie", "<cmd>CopilotChatExplain<CR>", { "n", "v" }, desc = "CopilotChat Explain" },
            { "<leader>id", "<cmd>CopilotChatDocs<CR>", { "n", "v" }, desc = "CopilotChat Document Code" },
            { "<leader>if", "<cmd>CopilotChatFix<CR>", { "n", "v" }, desc = "CopilotChat Suggest Fixes" },
            { "<leader>ir", "<cmd>CopilotChatReview<CR>", { "n", "v" }, desc = "CopilotChat Review" },
            { "<leader>is", "<cmd>CopilotChatSave ", { "n", "v" }, desc = "CopilotChat Save Chat" },
            { "<leader>ip", "<cmd>CopilotChatLoad ", { "n", "v" }, desc = "CopilotChat Load Chat" },
        },
    },
    {
        "ravitemer/mcphub.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            extensions = {
                copilotchat = {
                    enabled = true,
                    convert_tools_to_functions = true,
                    convert_resources_to_functions = true,
                    add_mcp_prefix = false,
                },
            },
        },
        config = function(_, opts)
            if vim.fn.executable("mcp-hub") == 1 then
                require("mcphub").setup(opts)
            end
        end,
    },
    --{
    --    "olimorris/codecompanion.nvim",
    --    dependencies = {
    --        "nvim-lua/plenary.nvim",
    --        "nvim-treesitter/nvim-treesitter",
    --        "dyamon/codecompanion-copilot-enterprise.nvim",
    --    },
    --    opts = {
    --        opts = {
    --            log_level = "DEBUG",
    --        },
    --        adapters = {
    --            http = {
    --                copilot_enterprise = function()
    --                    local adapter = require 'codecompanion.adapters.http.copilot_enterprise'
    --                    adapter.opts.provider_url = "https://uppsala-monitoring-centre.ghe.com" -- 'https://' can be removed but doesn't hurt.
    --                    return adapter
    --                end,
    --            },
    --        },
    --        interactions = {
    --            chat = {
    --                -- Setup the custom adapter for each strategy. You can change default models as usual.
    --                -- See https://codecompanion.olimorris.dev/configuration/adapters.html#changing-the-default-adapter
    --                -- and https://codecompanion.olimorris.dev/configuration/adapters.html#changing-a-model
    --                adapter = {
    --                    name = "copilot_enterprise",
    --                    --model = "claude-sonnet-4",
    --                },
    --            },
    --            inline = {
    --                adapter = "copilot_enterprise",
    --            },
    --            cmd = {
    --                adapter = "copilot_enterprise",
    --            },
    --        },

    --    },
    --    config = function(_, opts)
    --        require("codecompanion").setup(opts)
    --    end,
    --}
}
