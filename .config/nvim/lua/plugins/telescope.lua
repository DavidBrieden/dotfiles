

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

      wk.register({["<leader>f"] = {name = "+Telescope"}})
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc= "Find Files"})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc= "Live Grep"})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc= "Find Buffers"})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc= "Find Help Tags"})
      vim.keymap.set('n', '<leader>fn', find_nvim, {desc= "Find Nvim Config Files"})
    end
  },
}
