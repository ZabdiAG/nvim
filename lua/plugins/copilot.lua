return {
  "github/copilot.vim",
  init = function()
    -- Disable by default
    vim.g.copilot_enabled = 0
  end,
  config = function()
    -- Your Lua toggle function
    function CopilotToggle()
      if vim.g.copilot_enabled == 0 then
        vim.g.copilot_enabled = 1
        vim.cmd("Copilot enable")
        print("Copilot enabled")
      else
        vim.g.copilot_enabled = 0
        vim.cmd("Copilot disable")
        print("Copilot disabled")
      end
    end
  end,
  keys = {
    { "<leader>cop", "<cmd>lua CopilotToggle()<cr>", desc = "Toggle Copilot" },
  },
}
