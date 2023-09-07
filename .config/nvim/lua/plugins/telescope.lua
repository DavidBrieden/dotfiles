

local find_nvim = function()
    require("telescope.builtin").find_files({
      prompt_title = "~ dotfiles ~",
      cwd = vim.api.nvim_list_runtime_paths()[1]
  })
end


return {
  {
    "nvim-telescope/telescope.nvim",
    init = function()
      local builtin = require('telescope.builtin')
      local wk = require("which-key")
      local keymap_set = vim.keymap.set

      wk.register({["<leader>f"] = {name = "+Telescope"}})
      keymap_set('n', '<leader>ff', builtin.find_files, {desc= "Find Files"})
      keymap_set('n', '<leader>fg', builtin.live_grep, {desc= "Live Grep"})
      keymap_set('n', '<leader>fb', builtin.buffers, {desc= "Find Buffers"})
      keymap_set('n', '<leader>fh', builtin.help_tags, {desc= "Find Help Tags"})
      keymap_set('n', '<leader>fn', find_nvim, {desc= "Find Nvim Config Files"})
      keymap_set('n', '<leader>fe', require("telescope").extensions.emoji.emoji, {desc= "Select Emojis"})
    end
  },
  {
    "xiyaowong/telescope-emoji.nvim",
    init = function()
      require("telescope").load_extension("emoji")
    end
  }
}
