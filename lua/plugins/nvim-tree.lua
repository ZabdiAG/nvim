-- lua/plugins/nvim-tree.lua
return {
  "nvim-tree/nvim-tree.lua",
  -- Recommended dependency for icons
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    -- This is the direct replacement for your NERDTreeToggle mapping
    { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
    
    -- A useful keymap to find the current file in the tree
    -- You can use <leader>e for "explorer"
    { "<leader>e", "<cmd>NvimTreeFindFile<cr>", desc = "Find current file in explorer" },
  },
  config = function()
    -- Disable netrw which is a default file explorer.
    -- This is not strictly necessary but is good practice.
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      -- This is the equivalent of `let g:NERDTreeWinPos = "right"`
      view = {
        side = "right",
        width = 30, -- you can set the width of the explorer window
      },
      
      -- Recommended settings for a better experience
      renderer = {
        group_empty = true, -- show empty folders
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
      
      -- Automatically close the tree when you open a file
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },

      -- When you switch buffers, the tree will automatically highlight the new file
      update_focused_file = {
        enable = true,
        update_root = false,
      },
    })
  end,
}
