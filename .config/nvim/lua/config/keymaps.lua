local keymap = vim.api.nvim_set_keymap

local function default_opts(desc)
  return {
    noremap = true,
    desc = desc,
  }
end

-- editing vimrc and stuff
-- wk.register(
--   { "<leader>e", group = "Open some important files" }
-- )
keymap("n", "<leader>ec", ":split ~/dotfiles/cheatsheet.md<cr>", default_opts("Open Cheatsheet"))
keymap("n", "<leader>ev", ":split $MYVIMRC<cr>", default_opts("Open vimrc"))

-- folding
keymap("n", "<leader><leader>", "za", default_opts("Toggle fold under cursor"))

-- marks
keymap("n", "<C-F2>", "m;", {})
keymap("n", "<F2>", "m]", {})
keymap("n", "<S-F2>", "m[", {})

-- window movement
keymap("n", "<S-J>", "<C-W><C-J>", default_opts("move to left buffer"))
keymap("n", "<S-K>", "<C-W><C-K>", default_opts("move to down buffer"))
keymap("n", "<S-L>", "<C-W><C-L>", default_opts("move to up buffer"))
keymap("n", "<S-H>", "<C-W><C-H>", default_opts("move to right buffer"))

-- insert mode navigation
keymap("i", "<C-h>", "<Left>", default_opts("move left"))
keymap("i", "<C-j>", "<Down>", default_opts("move down"))
keymap("i", "<C-k>", "<Up>", default_opts("move up"))
keymap("i", "<C-l>", "<Right>", default_opts("move right"))

-- indentation
keymap("v", "<", "<gv", default_opts("indent left"))
keymap("v", ">", ">gv", default_opts("indent right"))

-- buffer delete
keymap("n", "<leader>q", ":BD<cr>", default_opts("Buffer Delete"))

-- Add new line above in Insert Mode
keymap("i", "<M-CR>", "<ESC>O", default_opts("Add Line Above"))

-- show documentation for what is under cursor
vim.keymap.set("n", "<leader>F", function()
  require("conform").format()
end, default_opts("Format Code"))
