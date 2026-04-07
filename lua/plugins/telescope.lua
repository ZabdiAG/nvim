return {
  "nvim-telescope/telescope.nvim",
  version = '*',
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    -- You can add custom telescope configuration here if needed
  end,
  -- Keymaps go here
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
  },
}
