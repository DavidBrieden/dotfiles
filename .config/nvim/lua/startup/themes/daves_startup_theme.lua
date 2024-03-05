local settings = {
  -- every line should be same width without escaped \
  header = {
    type = "text",
    oldfiles_directory = false,
    align = "center",
    fold_section = false,
    title = "Header",
    margin = 5,
    content = {
      "██╗  ██╗██╗    ██████╗  █████╗ ██╗   ██╗███████╗    ██╗",
      "██║  ██║██║    ██╔══██╗██╔══██╗██║   ██║██╔════╝    ██║",
      "███████║██║    ██║  ██║███████║██║   ██║█████╗      ██║",
      "██╔══██║██║    ██║  ██║██╔══██║╚██╗ ██╔╝██╔══╝      ╚═╝",
      "██║  ██║██║    ██████╔╝██║  ██║ ╚████╔╝ ███████╗    ██╗",
      "╚═╝  ╚═╝╚═╝    ╚═════╝ ╚═╝  ╚═╝  ╚═══╝  ╚══════╝    ╚═╝",
    },
    highlight = "Statement",
    default_color = "",
    oldfiles_amount = 0,
  },
  -- name which will be displayed and command
  body = {
    type = "mapping",
    oldfiles_directory = false,
    align = "center",
    fold_section = false,
    title = "Basic Commands",
    margin = 5,
    content = {
      { "📁 Find Sessions", "SessionManager load_session", "<leader>fs" },
      { "📃 Find File", "Telescope find_files", "<leader>ff" },
      { "🔍 Find Word", "Telescope live_grep", "<leader>lg" },
      { "🕛 Recent Files", "Telescope oldfiles", "<leader>of" },
      { "📃 New File", "lua require'startup'.new_file()", "<leader>nf" },
    },
    highlight = "String",
    default_color = "",
    oldfiles_amount = 0,
  },

  options = {
    mapping_keys = true,
    cursor_column = 0.5,
    empty_lines_between_mappings = true,
    disable_statuslines = true,
    paddings = { 1, 3, 3, 0 },
  },
  mappings = {
    execute_command = "<CR>",
    open_file = "o",
    open_file_split = "<c-o>",
    open_section = "<TAB>",
    open_help = "?",
  },
  colors = {
    background = "#1f2227",
    folded_section = "#56b6c2",
  },
  parts = { "header", "body" },
}
return settings
