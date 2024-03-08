local opt = vim.opt

--opt.t_Co=256
--opt.background=dark
-- vim.cmd[[colorscheme PaperColor]]

opt.mousemoveevent = true

-- Ignore compiled files
opt.wildignore = "__pycache__"
opt.wildignore:append { "*.o", "*~", "*.pyc", "*pycache*" }
opt.wildignore:append { "Cargo.lock", "Cargo.Bazel.lock" }

-- File specific vim settings
opt.modelines = 1

-- Enable per-directory .vimrc files and disable unsafe commands in them
opt.exrc = true
opt.secure = true

-- Show line numbers
opt.number = true

-- Tabs
opt.autoindent = true
opt.cindent = true
opt.wrap = true

opt.tabstop = 4
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true

-- Cursorline highlighting control
opt.cursorline = true -- Highlight the current line
-- TODO: Do I want that only in the active buffer? I kinda like that I can highlight a specific row in a different buffer...
--local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
--local set_cursorline = function(event, value, pattern)
--  vim.api.nvim_create_autocmd(event, {
--    group = group,
--    pattern = pattern,
--    callback = function()
--      vim.opt_local.cursorline = value
--    end,
--  })
--end
--set_cursorline("WinLeave", false)
--set_cursorline("WinEnter", true)
--set_cursorline("FileType", false, "TelescopePrompt")


-- Show “invisible” characters
opt.list = true
opt.listchars = {eol = '↵', trail = '·', tab = '▸ ' }

-- Ignore case in searches
opt.ignorecase = true
-- Highlight dynamically as pattern is typed
opt.incsearch = true

-- Enable mouse in all modes
opt.mouse = "a"

-- Start scrolling ten lines before the horizontal window border
opt.scrolloff = 10

-- disable wrapping of lines
opt.wrap = false

-- Changing buffers without saving
opt.hidden = true

-- Set Linear at 120 chars
opt.colorcolumn = "120"

-- Don't litter swp files everywhere
--opt.backupdir = "~/.cache"
--opt.directory = "~/.cache"


-- new buffer splits should be at the bottom/right
opt.splitbelow = true
opt.splitright = true

-- make column for git and stuff up to 3 signs wide
opt.signcolumn = 'auto:3'

-- opens new files with opened folds
opt.foldlevel = 20
