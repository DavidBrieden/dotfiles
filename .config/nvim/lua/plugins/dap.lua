return {
  {
    "mfussenegger/nvim-dap",
      dependencies = {
            "mfussenegger/nvim-dap-python",  -- Python-Adapter
                  },
    config = function()
      local dap = require("dap")
      local dap_python = require("dap-python")

      dap_python.setup("python")
      -- Keymaps
      vim.keymap.set("n", "<leader>dd", dap.continue, { desc = "Debug: Continue" })
      vim.keymap.set("n", "<leader>dj", dap.step_over, { desc = "Debug: Step Over" })
      vim.keymap.set("n", "<leader>dl", dap.step_into, { desc = "Debug: Step Into" })
      vim.keymap.set("n", "<leader>dk", dap.step_out, { desc = "Debug: Step Out" })
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })
      -- vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle UI" })
    end,
  },
}
