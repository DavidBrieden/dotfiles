local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local wk = require("which-key")

function default_opts(desc)
  return {
    noremap = true,
    desc = desc
  }
end

-- editing vimrc and stuff
wk.register({["<leader>e"] = {name = "+Open some important files"}})
keymap("n", "<leader>ec", ":split ~/dotfiles/cheatsheet.md<cr>", default_opts("Open Cheatsheet"))
keymap("n", "<leader>ev", ":split $MYVIMRC<cr>", default_opts("Open vimrc"))

-- folding
keymap("n", "<leader><leader>", "za", default_opts("Toggle fold under cursor"))
