return {
  { "tpope/vim-repeat" },
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
      { "<leader>pb",    ":BufferLinePick<cr>" },
      { "<leader>pD",    ":BufferLinePickClose<cr>" },
      { "<S-C-h>",       ":BufferLineMovePrev<cr>" },
      { "<Leader><C-h>", ":BufferLineMovePrev<cr>" },
      { "<S-C-l>",       ":BufferLineMoveNext<cr>" },
      { "<Leader><C-l>", ":BufferLineMoveNext<cr>" },
      { "<C-h>",         ":BufferLineCyclePrev<cr>" },
      { "<C-l>",         ":BufferLineCycleNext<cr>" },
    },
    opts = {
      options = {
        -- separator_style = "slant",
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
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
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
      require("leap").opts.highlight_unlabled_phase_one_targets = true
      -- require('leap').add_default_mappings()
      vim.keymap.set({ 'n', 'x', 'o' }, '<leader>s', '<Plug>(leap-forward)')
      vim.keymap.set({ 'n', 'x', 'o' }, '<leader>S', '<Plug>(leap-backward)')
      vim.keymap.set({ 'n', 'x', 'o' }, '<leader>gs', '<Plug>(leap-from-window)')
      vim.api.nvim_set_hl(0, 'Cursor', { reverse = true })

      vim.api.nvim_create_autocmd(
        "User",
        {
          callback = function()
            vim.cmd.hi("Cursor", "blend=100")
            vim.opt.guicursor:append { "a:Cursor/lCursor" }
          end,
          pattern = "LeapEnter"
        }
      )
      vim.api.nvim_create_autocmd(
        "User",
        {
          callback = function()
            vim.cmd.hi("Cursor", "blend=0")
            vim.opt.guicursor:remove { "a:Cursor/lCursor" }
          end,
          pattern = "LeapLeave"
        }
      )
    end
  },
  {
    "ggandor/flit.nvim", -- enhanced leap motions
    config = function()
      require("flit").setup()
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
  {
    "startup-nvim/startup.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require "startup".setup({ theme = "daves_startup_theme" })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "startup" },
        callback = function()
          vim.opt_local.colorcolumn = ""
        end
      })
    end
  },
  { "qpkorr/vim-bufkill" },
  {
    "Isrothy/neominimap.nvim",
    init = function()
      vim.opt.wrap = false
      vim.opt.sidescrolloff = 36
    end
  },
  -- file finder
  { "nvim-lua/plenary.nvim" }, -- dependency of telescope
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup()
    end
  },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      local ls = require("luasnip")
      -- some shorthands...
      local snip = ls.snippet
      -- local node = ls.snippet_node
      -- local text = ls.text_node
      -- local insert = ls.insert_node
      local func = ls.function_node
      -- local choice = ls.choice_node
      -- local dynamicn = ls.dynamic_node

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
    opts = {
      force_write_shada = true,
      mappings = {
        next = "<Leader>m",
        prev = "<Leader>M"
      }
    }
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
          require("neo-tree.command").execute({ toggle = true, dir = vim.fn.getcwd() })
        end,
      })
    end
  },
  -- automaticly highlight other uses of the word under the cursor
  {
    "RRethy/vim-illuminate",
    config = function()
      require('illuminate').configure({
        min_count_to_highlight = 2,
      })
    end
  },
  {
    "norcalli/nvim-colorizer.lua",
    main = "colorizer",
    config = function()
      vim.o.termguicolors = true
      require "colorizer".setup(nil, { css = true, })
    end
  },
  {
    "gbprod/substitute.nvim",
    opts = {
    },
    config = function()
      require("substitute").setup()

      vim.keymap.set("n", "s", require('substitute').operator, { noremap = true })
      vim.keymap.set("n", "ss", require('substitute').line, { noremap = true })
      vim.keymap.set("n", "S", require('substitute').eol, { noremap = true })
      vim.keymap.set("x", "s", require('substitute').visual, { noremap = true })
      vim.keymap.set("n", "sx", require('substitute.exchange').operator, { noremap = true })
      vim.keymap.set("n", "sxx", require('substitute.exchange').line, { noremap = true })
      vim.keymap.set("x", "X", require('substitute.exchange').visual, { noremap = true })
      vim.keymap.set("n", "sxc", require('substitute.exchange').cancel, { noremap = true })
    end
  },
  {
    'jesseleite/nvim-macroni',
    opts = {
      macros = {
        pwsh_new_tab = {
          desc = "Open a new Powershell Tab",
          macro = ":!wt -w 0 nt -d .<ESC>"
        }
      }
    },
  }
}
