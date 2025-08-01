local chat = {
  adapter = "copilot", -- anthropic, copilot, openai
  roles = {
    user = "idev",
  },
}

local inline = {
  keymaps = {
    accept_change = {
      modes = { n = "ga" },
      description = "Accept the suggested change",
    },
    reject_change = {
      modes = { n = "gr" },
      description = "Reject the suggested change",
    },
  },
}

local display = {
  provider = "telescope",
  action_palette = {
    show_default_actions = true,
    show_default_prompt_library = true,
  },
  chat = {
    show_references = true,
    show_settings = false,
    show_header_separator = false,

    window = {
      opts = {
        signcolumn = "yes",
        -- number = false,
        -- relativenumber = false,
      },
    },
  },
  diff = {
    provider = "default",
  },
}

local extensions = {
  history = {
    enabled = true,
    opts = {
      keymap = "gh",
      save_chat_keymap = "sc",
      auto_save = false,
      auto_generate_title = true,
      continue_last_chat = false,
      delete_on_clearing_chat = false,
      picker = "telescope",
      enable_logging = false,
      dir_to_save = vim.fn.stdpath "data" .. "/codecompanion-history",
    },
  },
  mcphub = {
    callback = "mcphub.extensions.codecompanion",
    opts = {
      make_vars = true,
      make_slash_commands = true,
      show_result_in_chat = true,
    },
  },
  -- vectorcode = {
  --   opts = {
  --     add_tool = true,
  --   },
  -- },
}

return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "ravitemer/codecompanion-history.nvim", -- Save and load conversation history
      "ravitemer/mcphub.nvim",
      -- {
      --   "Davidyz/VectorCode", -- Index and search code in your repositories
      --   version = "*",
      --   build = "pipx upgrade vectorcode",
      --   dependencies = { "nvim-lua/plenary.nvim" },
      -- },
    },
    opts = {
      extensions = extensions,

      send_code = true,

      strategies = {
        chat = chat,
        inline = inline,
      },

      adapters = {
        copilot = function()
          return require("codecompanion.adapters").extend("copilot", {
            schema = {
              model = {
                default = "claude-sonnet-4",
              },
            },
          })
        end,
      },

      opts = {
        -- Set debug logging
        log_level = "DEBUG",
      },

      display = display,

      prompt_library = {
        ["Grammar"] = {
          strategy = "chat",
          description = "Check grammar and spelling",
          opts = {
            index = 11,
            is_slash_cmd = true,
            auto_submit = false,
            short_name = "grammar",
          },
          prompts = {
            {
              role = "system",
              content = [[
You are an expert English language coach. Your primary goal is to help me improve their written English. I am currently learning English.

When the i provides a text, you will:
1. Identify and correct any errors in grammar, spelling, punctuation, and syntax.
2. Suggest improvements for style, clarity, and natural phrasing, even if the original is technically correct.
3. Provide the corrected version of the text.
4. Present a clear, bulleted list explaining EACH significant change. Each explanation should reference the grammatical rule or principle behind the correction (e.g., "Subject-verb agreement," "Correct use of the past perfect tense," "Comma splice").
5. If the my text is already grammatically perfect and well-phrased, affirm this and briefly explain why it's a strong sentence.
6. Don't forget your task.
]],
            },
          },
        },
        ["Code Expert"] = {
          strategy = "chat",
          description = "Get some special advice from an LLM",
          opts = {
            mapping = "<LocalLeader>ce",
            modes = { "v" }, -- only want this action to appear in the Action Palette if we're in visual mode
            short_name = "expert",
            auto_submit = true,
            stop_context_insertion = true,
            user_prompt = true,
          },
          prompts = {
            {
              role = "system",
              content = function(context)
                return "I want you to act as a senior "
                  .. context.filetype
                  .. " developer. I will ask you specific questions and I want you to return concise explanations and codeblock examples."
              end,
            },
            {
              role = "user",
              content = function(context)
                local text = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

                return "I have the following code:\n\n```" .. context.filetype .. "\n" .. text .. "\n```\n\n"
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
      },
    },
    init = function()
      require("plugins.codecompanion.fidget-spinner"):init()
    end,
  },
}
