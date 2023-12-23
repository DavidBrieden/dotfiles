return {
  { "ryanoasis/vim-devicons" },
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
    }
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    lazy = false,
    keys = {
      { "<leader>pb", ":BufferLinePick<cr>" },
      { "<leader>pD", ":BufferLinePickClose<cr>" },
      { "<S-C-h>",    ":BufferLineMovePrev<cr>" },
      { "<S-C-l>",    ":BufferLineMoveNext<cr>" },
    },
    opts = {
      options = {
        separator_style = "slant",
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" }
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
  { "vim-scripts/ClosePairs" }, -- automaticly insert closing brackets
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        disabled_filetypes = { "startify", "neo-tree", "minimap" },
      },
      sections = {
        lualine_x = { 'encoding', 'filetype' },
      },
    }
  },
  {
    "adisen99/apprentice.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    priority = 1000,
    config = function()
      require("lush")(require("apprentice").setup({
        plugins = {
          "buftabline",
          "coc",
          "cmp", -- nvim-cmp
          "fzf",
          "gitgutter",
          "gitsigns",
          "lsp",
          "lspsaga",
          "nerdtree",
          "netrw",
          "nvimtree",
          "neogit",
          "packer",
          "signify",
          "startify",
          "syntastic",
          "telescope",
          "treesitter"
        },
      }))
    end,
    init = function()
      vim.g.apprentice_contrast_dark = "hard"
      vim.cmd [[colorscheme apprentice]]
      vim.opt.termguicolors = true
      -- indent-blankline highlighting
      vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

      local highlights = {
        IlluminatedWord = { bg = "#636363" },
        IlluminatedCurWord = { bg = "#636363" },
        IlluminatedWordText = { bg = "#636363" },
        IlluminatedWordRead = { bg = "#636363" },
        IlluminatedWordWrite = { bg = "#636363" },
      }

      for group, value in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, value)
      end
    end
  },
  { "tpope/vim-fugitive" }, -- git plugin
  { "tpope/vim-surround" }, -- surrounding text with brackets an stuff
  -- { "airblade/vim-gitgutter" }, -- shows git changes
  {
    "lewis6991/gitsigns.nvim",
    config = true
  },
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end
  },
  {
    "majutsushi/tagbar",
    keys = {
      { "<F8>", ":TagbarToggle<cr>" }
    }
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },
  { "mhinz/vim-startify" },
  { "qpkorr/vim-bufkill" },
  {
    "echasnovski/mini.map",
    main = "mini.map",
    lazy = false,
    keys = {
      { "<Leader>mm", "<cmd>lua MiniMap.toggle()<CR>", desc = "toggle Minimap" },
    },
    opts = function()
      local minimap = require("mini.map")
      return {
        symbols = {
          encode = require("mini.map").gen_encode_symbols.dot("4x2"),
        },
        integrations = {
          minimap.gen_integration.diagnostic(),
          minimap.gen_integration.builtin_search(),
          minimap.gen_integration.gitsigns(),
        },
        window = {
          winblend = 0,
          show_integration_count = false,
        },
      }
    end,
  },
  -- file finder
  { "nvim-lua/plenary.nvim" }, -- dependency of telescope
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
        char = "│"
      }
    },
    config = true
  },
  {
    "L3MON4D3/LuaSnip",
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

      local date = function() return { os.date('%Y-%m-%d') } end

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
  },
  {
    'chentoast/marks.nvim',
    config = true
  },
  {
    'Shatur/neovim-session-manager',
    config = function()
      local config = require('session_manager.config')
      require('session_manager').setup({
        autoload_mode = config.AutoloadMode.Disabled,
        autosave_only_in_session = true
      })

      vim.api.nvim_create_autocmd({ 'User' }, {
        pattern = "SessionLoadPost",
        -- group = config_group,
        callback = function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
          require("mini.map").open()
        end,
      })
    end
  },
  -- automaticly highlight other uses of the word under the cursor
  {
    "RRethy/vim-illuminate",
  }
}
