return {
  { "ryanoasis/vim-devicons" },
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require('nightfox').setup({
        options = {
          transparent = true
        }
      })
      vim.cmd("colorscheme carbonfox")

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
    end
  },

}