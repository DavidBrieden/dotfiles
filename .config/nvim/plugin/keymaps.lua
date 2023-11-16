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

-- marks
keymap("n", "<C-F2>", "m;", {})
keymap("n", "<F2>", "m]", {})
keymap("n", "<S-F2>", "m[", {})

-- insert mode navigation
keymap("i", "<C-h>", "<Left>", default_opts("move left"))
keymap("i", "<C-j>", "<Down>", default_opts("move down"))
keymap("i", "<C-k>", "<Up>", default_opts("move up"))
keymap("i", "<C-l>", "<Right>", default_opts("move right"))
