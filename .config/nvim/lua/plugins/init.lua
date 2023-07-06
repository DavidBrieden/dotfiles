return {
  {"ryanoasis/vim-devicons"},
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    lazy = false,
    keys = {
      {"<leader>gb", ":BufferLinePick<cr>"},
      {"<leader>gD", ":BufferLinePickClose<cr>"},
      {"<S-C-h>", ":BufferLineMovePrev<cr>"},
      {"<S-C-l>", ":BufferLineMoveNext<cr>"},
    },
    opts = {
      options = {
        separator_style = "slant",
        hover = {
          enabled = true,
          delay = 200,
          reveal = {"close"}
        },
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true -- use a "true" to enable the default, or set your own character
          }
        }
      }
    },
    config = true,

  },
  {"vim-scripts/ClosePairs"}, -- automaticly insert closing brackets
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        disabled_filetypes = {"startify", "neo-tree"},
      },
      sections = {
        lualine_x = {'encoding', 'filetype'},
      },
    }
  },
  {
    "NLKNguyen/papercolor-theme",
    priority = 1000,
    init = function()
      vim.cmd[[colorscheme PaperColor]]
      vim.opt.termguicolors = true
      -- indent-blankline highlighting
      vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]
    end
  },
  {"tpope/vim-fugitive"}, -- git plugin
  {"tpope/vim-surround"}, -- surrounding text with brackets an stuff
  {"airblade/vim-gitgutter"}, -- shows git changes
  {
    "phaazon/hop.nvim",
    config = true,
    keys = {
      {"f", ":HopChar1MW<cr>"},
      -- {"/", ":HopPatternMW<cr>"},
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
    opts = {
      show_empty = false,
      window = {
        border = "double"
      }
    },
    cmd = "Registers",
    config = true
    --config = function()
    --    require("registers").setup()
    --end,
  },

  -- file finder
  {"nvim-lua/plenary.nvim"}, -- dependency of telescope
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      char = "",
      char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
      },
      space_char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
      },
      filetype_exclude = {
        "startify"
      },
      show_trailing_blankline_indent = false,
      show_current_context = true,
      show_current_context_start = true
    },
    config = true
  },
  {"nvim-treesitter/nvim-treesitter"}
}
