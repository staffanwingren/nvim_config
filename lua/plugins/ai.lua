return {
    {
        "github/copilot.vim",
        enabled = false,
        config = function()
            vim.g.copilot_no_tab_map = true
            vim.keymap.set("i", "<M-Enter>", "copilot#Accept('<CR>')", {
                silent = true,
                expr = true,
                replace_keycodes = false,
                desc = "Copilot Accept",
            })
        end,
    },
    {
        "zbirenbaum/copilot.lua",
        enabled = false,
        event = "InsertEnter",
        opts = {
            suggestion = { enabled = false },
            panel = { enabled = false },
        },
    },
    {
        "zbirenbaum/copilot-cmp",
        enabled = false,
        config = function()
            require("copilot_cmp").setup()
        end,
    },
    {
        "Bryley/neoai.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        cmd = {
            "NeoAI",
            "NeoAIOpen",
            "NeoAIClose",
            "NeoAIToggle",
            "NeoAIContext",
            "NeoAIContextOpen",
            "NeoAIContextClose",
            "NeoAIInject",
            "NeoAIInjectCode",
            "NeoAIInjectContext",
            "NeoAIInjectContextCode",
        },
        keys = {
            { "<leader>as", desc = "summarize text" },
            { "<leader>ag", desc = "generate git message" },
        },
        config = function()
            require("neoai").setup {
                require("neoai").setup {
                    -- Below are the default options, feel free to override what you would like changed
                    ui = {
                        output_popup_text = "NeoAI",
                        input_popup_text = "Prompt",
                        width = 30, -- As percentage eg. 30%
                        output_popup_height = 80, -- As percentage eg. 80%
                        submit = "<Enter>", -- Key binding to submit the prompt
                    },
                    models = {
                        {
                            name = "openai",
                            model = "gpt-4-turbo-preview",
                            params = nil,
                        },
                    },
                    register_output = {
                        ["g"] = function(output)
                            return output
                        end,
                        ["c"] = require("neoai.utils").extract_code_snippets,
                    },
                    inject = {
                        cutoff_width = 75,
                    },
                    prompts = {
                        context_prompt = function(context)
                            return "Hey, I'd like to provide some context for future "
                                .. "messages. Here is the code/text that I want to refer "
                                .. "to in our upcoming conversations:\n\n"
                                .. context
                        end,
                    },
                    mappings = {
                        ["select_up"] = "<C-k>",
                        ["select_down"] = "<C-j>",
                    },
                    open_ai = {
                        api_key = {
                            env = "OPENAI_API_KEY",
                            value = nil,
                            -- `get` is is a function that retrieves an API key, can be used to override the default method.
                            -- get = function() ... end

                            -- Here is some code for a function that retrieves an API key. You can use it with
                            -- the Linux 'pass' application.
                            -- get = function()
                            --     local key = vim.fn.system("pass show openai/mytestkey")
                            --     key = string.gsub(key, "\n", "")
                            --     return key
                            -- end,
                        },
                    },
                    shortcuts = {
                        {
                            name = "textify",
                            key = "<leader>as",
                            desc = "fix text with AI",
                            use_context = true,
                            prompt = [[
                Please rewrite the text to make it more readable, clear,
                concise, and fix any grammatical, punctuation, or spelling
                errors
            ]],
                            modes = { "v" },
                            strip_function = nil,
                        },
                        {
                            name = "gitcommit",
                            key = "<leader>ag",
                            desc = "generate git commit message",
                            use_context = false,
                            prompt = function()
                                return [[
                    Using the following git diff generate a consise and
                    clear git commit message, with a short title summary
                    that is 75 characters or less:
                ]] .. vim.fn.system "git diff --cached"
                            end,
                            modes = { "n" },
                            strip_function = nil,
                        },
                    },
                },
            }
        end,
    },
}
