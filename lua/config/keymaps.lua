local keymap = vim.keymap.set

-- General mappings
keymap("n", "<leader>hl", ":set hlsearch!<CR>", { desc = "Toggle highlight search" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap("n", "<leader>w", ":w<CR>", { desc = "Write/Save" })
keymap("n", "<leader>wq", ":wq<CR>", { desc = "Write and Quit" })

-- Window management
keymap("n", "<leader>[", ":vertical resize -5<CR>", { desc = "Decrease vertical split size" })
keymap("n", "<leader>]", ":vertical resize +5<CR>", { desc = "Increase vertical split size" })

-- Utility: Remove trailing whitespace
keymap("n", "<leader>dts", ":%s/\\s\\+$//e<CR>", { desc = "Delete trailing spaces" })

-- Utility: Insert UUID
-- The function itself can be defined here or in a separate utils file
local function insert_uuid()
  local uuid = vim.fn.system("uuidgen")
  uuid = uuid:gsub("\n", "")
  vim.api.nvim_put({ uuid }, "c", true, true)
end
keymap("n", "<leader>uuid", insert_uuid, { desc = "Insert UUID" })
