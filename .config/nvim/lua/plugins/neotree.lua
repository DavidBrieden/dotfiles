return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim"
    },
    cmd = "Neotree",
    keys = {
      {
        "<F9>",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      }
    },
    opts = {
      close_if_last_window = true,
      sources = {
        "filesystem",
        "buffers",
        "git_status",
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = true,
        },
      },
      source_selector = {
        winbar = true, -- toggle to show selector on winbar
        statusline = false,
        content_layout = "center",
        tabs_layout = "equal",
        show_separator_on_edge = true,
        sources = {
          { source = "filesystem", display_name = "F" },
          { source = "buffers",    display_name = "B" },
          { source = "git_status", display_name = "G" },
        },
      },
      window = {
        mappings = {
          ['f'] = function() vim.api.nvim_exec('Neotree focus filesystem left', true) end,
          ['b'] = function() vim.api.nvim_exec('Neotree focus buffers left', true) end,
          ['g'] = function() vim.api.nvim_exec('Neotree focus git_status left', true) end,
          ['o'] = "system_open",
          ['<tab>'] = "toggle_node"
        },
      },
      commands = {
        system_open = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          -- open in windows
          vim.api.nvim_command("silent !explorer " .. path)
        end,
      },
    },
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
    end
  },
}
