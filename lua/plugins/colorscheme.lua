return {
  "rebelot/kanagawa.nvim",
  name = "kanagawa",
  priority = 1000, -- Make sure it loads first
  config = function()
    vim.cmd.colorscheme("kanagawa-wave")
  end,
}
