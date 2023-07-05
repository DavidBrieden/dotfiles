

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
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>fn', find_nvim, {})
    end
  },
}
