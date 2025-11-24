return {
  "neovim/nvim-lspconfig",
  { "mason-org/mason.nvim", opts = {} },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "html",
        "cssls",
        "ts_ls",
        "eslint",
        "jsonls",
        "yamlls",
        "tailwindcss",
        "lua_ls",
        "pyright",
        "bashls",
      },
    },
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- list of formatter and linter for mason to install
      ensure_installed = {
        "stylua", -- lua formatter
        "black",  -- python formatter
        "pylint", -- python linter
        "shfmt",  -- sh formatter with bash support
      },
    },
  },
  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
      completion = {
        trigger = {
          show_on_insert = true,
        },
        list = {
          selection = {
            preselect = false,
          },
        },
      },
      keymap = {
        preset = "enter",
        ["S-Tab>"] = { "select_prev", "fallback" },
        -- ["<S-j>"] = { "select_prev", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        -- ["<S-k>"] = { "select_next", "fallback" },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "black" },
        -- lua = { "stylua" }, -- TODO: does this work? the last time I checked it didn't
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
    },
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
