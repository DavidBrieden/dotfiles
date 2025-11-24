local find_nvim = function()
  require("telescope.builtin").find_files({
    prompt_title = "~ dotfiles ~",
    cwd = vim.api.nvim_list_runtime_paths()[1]
  })
end


return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "xiyaowong/telescope-emoji.nvim" },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-telescope/telescope-live-grep-args.nvim' }
    },
    init = function()
      local builtin = require('telescope.builtin')
      local telescope = require('telescope')
      local wk = require("which-key")
      local keymap_set = vim.keymap.set

      local lga_actions = require("telescope-live-grep-args.actions")
      local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

      telescope.setup {
        defaults = {
          path_display = { "smart" },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
          buffers = {
            mappings = {
              n = {
                ['<c-d>'] = require('telescope.actions').delete_buffer
              }, -- n
              i = {
                ['<c-d>'] = require('telescope.actions').delete_buffer
              },
            },
          }
        },
        extensions = {
          live_grep_args = {
            auto_quoting = true, -- enable/disable auto-quoting
            -- define mappings, e.g.
            mappings = {         -- extend mappings
              i = {
                ["<C-k>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              },
            },
          }
        }
      }
      require("telescope").load_extension("live_grep_args")
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("emoji")

      -- wk.register({
      --   { "<leader>f", group = "Telescope" },
      -- })
      keymap_set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
      keymap_set('n', '<leader>fk', builtin.keymaps, { desc = "Find Keymaps" })
      keymap_set('n', '<leader>fD', builtin.diagnostics, { desc = "Find Diagnostics in all buffers" })
      keymap_set('n', '<leader>fd', function() builtin.diagnostics({ bufnr = 0 }) end, { desc = "Find Diagnostics" })
      keymap_set("n", "<leader>fg", require("telescope").extensions.live_grep_args.live_grep_args, { desc = "Live Grep" })
      keymap_set('n', '<leader>fb', builtin.buffers, { desc = "Find Buffers" })
      keymap_set('n', '<leader>fh', builtin.help_tags, { desc = "Find Help Tags" })
      keymap_set('n', '<leader>fn', find_nvim, { desc = "Find Nvim Config Files" })
      keymap_set('n', '<leader>fe', require("telescope").extensions.emoji.emoji, { desc = "Select Emoji" })
      keymap_set('n', '<leader>fs', require("session_manager").load_session, { desc = "Select Session" })
      keymap_set('n', '<leader>fm', function() require('telescope').extensions.macroni.saved_macros() end, { desc = "Execute Makro" })

      keymap_set("n", "<leader>g",
        function() live_grep_args_shortcuts.grep_word_under_cursor({ postfix = "", quote = false }) end,
        { desc = "Grep word unter cursor" })
      keymap_set("v", "<leader>g",
        function() live_grep_args_shortcuts.grep_visual_selection({ postfix = "", quote = false }) end,
        { desc = "Grep selected text" })
    end
  },
}
