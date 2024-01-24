return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects"
    },
    config = function()
      require 'nvim-treesitter.configs'.setup {
        highlight = { enable = false },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            node_decremental = '<S-CR>',
            scope_incremental = '<TAB>',
            scope_decremental = '<S-TAB>',
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["if"] = { query = "@function.inner", desc = "Select inner part of a function" },
              ["af"] = { query = "@function.outer", desc = "Select outer part of a function" },
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
              ["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
              ["ip"] = { query = "@parameter.inner", desc = "Select inner part of a parameter region" },
              ["ap"] = { query = "@parameter.outer", desc = "Select outer part of a parameter region" },
            }
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]f"] = { query = "@function.outer", desc = "Next function start" },
              ["]c"] = { query = "@class.outer", desc = "Next class start" },
              ["]b"] = { query = "@block.outer", desc = "Next block start" },
            },
            goto_next_end = {
              ["]F"] = { query = "@function.outer", desc = "Next function end" },
              ["]C"] = { query = "@class.outer", desc = "Next class end" },
              ["]B"] = { query = "@block.outer", desc = "Next block end" },
            },
            goto_previous_start = {
              ["[f"] = { query = "@function.outer", desc = "Previous function start" },
              ["[c"] = { query = "@class.outer", desc = "Previous class start" },
              ["[b"] = { query = "@block.outer", desc = "Previous block start" },
            },
            goto_previous_end = {
              ["[F"] = { query = "@function.outer", desc = "Previous function end" },
              ["[C"] = { query = "@class.outer", desc = "Previous class end" },
              ["[B"] = { query = "@block.outer", desc = "Previous block end" },
            }
          },
          lsp_interop = {
            enable = true,
            border = 'none',
            floating_preview_opts = {},
            peek_definition_code = {
              ["<leader>df"] = "@function.outer",
              ["<leader>dc"] = "@class.outer",
            },
          },
        }
      }

      local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

      -- Repeat movement with ; and ,
      -- -- ensure ; goes forward and , goes backward regardless of the last direction
      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
      vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

      -- not really a treesitter thing, but make gitsigns movement repeatable
      -- local gs = require("gitsigns")

      -- -- make sure forward function comes first
      -- local next_hunk_repeat, prev_hunk_repeat = ts_repeat_move.make_repeatable_move_pair(gs.next_hunk, gs.prev_hunk)

      -- vim.keymap.set({ "n", "x", "o" }, "]h", next_hunk_repeat)
      -- vim.keymap.set({ "n", "x", "o" }, "[h", prev_hunk_repeat)
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = true,
    opts = {
      max_lines = 0,
      -- separator = "-"
    }
  },
}
