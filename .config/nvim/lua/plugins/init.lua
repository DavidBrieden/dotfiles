return {
  {"ryanoasis/vim-devicons"},
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    lazy = false,
    keys = {
      {"<leader>pb", ":BufferLinePick<cr>"},
      {"<leader>pD", ":BufferLinePickClose<cr>"},
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
    "adisen99/apprentice.nvim",
    dependencies = {"rktjmp/lush.nvim"},
    priority = 1000,
    config = function()
      require("lush")(require("apprentice").setup())
    end,
    init = function()
      vim.g.apprentice_contrast_dark = "hard"
      vim.cmd[[colorscheme apprentice]]
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
      {"<leader>w", ":HopWordMW<cr>", desc = "Hop to Word"},
      {"f", "<cmd>HopChar1MW<cr>", mode='v'},
      {"<leader>w", "<cmd>HopWordMW<cr>", desc = "Hop to Word", mode='v'},
      -- {"/", ":HopPatternMW<cr>"},
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

  -- file finder
  {"nvim-lua/plenary.nvim"}, -- dependency of telescope
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        indent = {
          highlight = {
            "IndentBlanklineIndent1",
            "IndentBlanklineIndent2",
          },
          char = " "
        },

        whitespace = {
          highlight = {
            "IndentBlanklineIndent1",
            "IndentBlanklineIndent2",
          },
          remove_blankline_trail = false
        },
        scope = {
          char = "|"
        }
      -- char = "",
      -- char_highlight_list = {
      --   "IndentBlanklineIndent1",
      --   "IndentBlanklineIndent2",
      -- },
      -- space_char_highlight_list = {
      --   "IndentBlanklineIndent1",
      --   "IndentBlanklineIndent2",
      -- },
      -- filetype_exclude = {
      --   "startify"
      -- },
      -- show_trailing_blankline_indent = false,
      -- show_current_context = true,
      -- show_current_context_start = true
    },
    config = true
  },
  {"nvim-treesitter/nvim-treesitter"},
  {
    "L3MON4D3/LuaSnip",
    after = 'nvim-cmp',
    config = function() 
      require("luasnip.loaders.from_vscode").lazy_load()
      local ls = require("luasnip")
      -- some shorthands...
      local snip = ls.snippet
      local node = ls.snippet_node
      local text = ls.text_node
      local insert = ls.insert_node
      local func = ls.function_node
      local choice = ls.choice_node
      local dynamicn = ls.dynamic_node

      local date = function() return {os.date('%Y-%m-%d')} end

      ls.add_snippets(nil, {
          all = {
              snip({
                  trig = "date",
                  namr = "Date",
                  dscr = "Date in the form of YYYY-MM-DD",
              }, {
                  func(date, {}),
              }),
          },
      })
    end, 
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  {
    'glacambre/firenvim',

    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    lazy = not vim.g.started_by_firenvim,
    build = function()
        vim.fn["firenvim#install"](0)
    end
}
}
