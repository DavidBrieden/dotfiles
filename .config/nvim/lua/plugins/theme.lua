return {
  { "ryanoasis/vim-devicons" },
  {
    "EdenEast/nightfox.nvim",
    priority = 49, --FIXME setting highlight groups only works if done after all plugins loaded...
    config = function()
      require('nightfox').setup({
        options = {
          transparent = true
        }
      })

      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = { "nightfox", "carbonfox" },
        callback = function(args)
          -- highlighting words, see vim-illuminate
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

          -- Minimap Background transparent
          vim.api.nvim_set_hl(0, "MiniMapNormal", { bg = "none" })

          -- Treesitter Context Background transparent
          vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "none" })
          vim.api.nvim_set_hl(0, "TreesitterContextBottom", { underline = true, sp = "#636363", bg = "none" })
        end
      })
    end
  },
  {
    'sainnhe/everforest',
    lazy = false,
    priority = 10000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.everforest_enable_italic = true
      vim.g.everforest_transparent_background = 2
      vim.g.everforest_current_word = "grey background"

      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "everforest",
        callback = function(args)
          -- Treesitter Context Background transparent
          vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "none" })
          vim.api.nvim_set_hl(0, "TreesitterContextBottom", { underline = true, sp = "#636363", bg = "none" })
        end
      })
    end
  }

}
