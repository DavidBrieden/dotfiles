return {

  {"vim-scripts/ClosePairs"}, -- automaticly insert closing brackets
  {
    "vim-airline/vim-airline",
	init = function()
	  vim.g.airline_powerline_fonts = true
	  vim.g.airline_theme= "papercolor"
	  vim.g["airline#extensions#tabline#enabled"] = true
	end
  }, -- status/tabline
  {"vim-airline/vim-airline-themes"},
  {"NLKNguyen/papercolor-theme"},
  {
    "scrooloose/nerdtree",
	keys = {
	  {"<F9>", ":NERDTreeToggle<cr>"}
	},
	init = function()
      vim.g.NERDTreeIgnore = {"node_modules", ".git"}
      vim.g.NERDTreeShowHidden=1
	end
  }, -- file tree
  {"xuyuanp/nerdtree-git-plugin"},
  {"tpope/vim-fugitive"}, -- git plugin
  {"tpope/vim-surround"}, -- surrounding text with brackets an stuff
  {"airblade/vim-gitgutter"}, -- shows git changes
  {
    "phaazon/hop.nvim",
	config = true,
	keys = {
	  {"f", ":HopChar1MW<cr>"},
	  {"/", ":HopPatternMW<cr>"},
	  {"<leader>w", ":HopWordMW<cr>"},
	}
  }, -- shows git changes
  {
    "majutsushi/tagbar",
	keys = {
	  {"<F8>", ":TagbarToggle<cr>"}
	}
  },
  {
    "preservim/nerdcommenter",
    init = function()
      vim.g.NERDSpaceDelims = true
	  vim.g.NERDDefaultAlign = 'left'
    end
  }, -- commenting stuff
  {"mhinz/vim-startify"},
  {"qpkorr/vim-bufkill"},
  {"Xuyuanp/scrollbar.nvim"},
  {
    "tversteeg/registers.nvim",
    name = "registers",
    keys = {
        { "\"",    mode = { "n", "v" } },
        { "<C-R>", mode = "i" }
    },
    cmd = "Registers",
	config = true
	--config = function()
	--	require("registers").setup()
	--end,
  },
  
  -- file finder
  {"nvim-lua/plenary.nvim"}, -- dependency of telescope
  {
	"nvim-telescope/telescope.nvim",
	init = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end
  }, 
}
