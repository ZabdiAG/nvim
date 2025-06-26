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

--Location List
keymap('n', '<leader>lo', ':lwindow<CR>', { desc = '[L]ocation [O]pen Window' })
keymap('n', '<leader>lq', ':lclose<CR>', { desc = '[L]ocation [Q]uit Window' })
keymap('n', '<leader>ln', ':lnext<CR>', { desc = '[L]ocation [N]ext Item' })
keymap('n', '<leader>lp', ':lprevious<CR>', { desc = '[L]ocation [P]revious Item' })

--Quickfix List
keymap('n', '<leader>ko', ':cwindow<CR>', { desc = '[Q]uickfix [O]pen Window' })
keymap('n', '<leader>kq', ':cclose<CR>', { desc = '[Q]uickfix [Q]uit Window' })
keymap('n', '<leader>kn', ':cnext<CR>', { desc = '[Q]uickfix [N]ext Item' })
keymap('n', '<leader>kp', ':cprevious<CR>', { desc = '[Q]uickfix [P]revious Item' })
keymap('n', '<leader>kf', ':cfile %<CR>', { desc = '[Q]uickfix open [F]ile under cursor' })

-- Pretty Print JSON
-- 1. Define a custom command that can filter a range through jq
--    -range=% means it takes a range, defaulting to the whole file (%) if none is given.
vim.cmd([[ command! -range=% JQFormat <line1>,<line2>!jq . ]])

-- 2. Create a single keymap for BOTH normal and visual mode
--    This keymap simply calls your new custom command.
vim.keymap.set({'n', 'v'}, '<leader>jq', ':JQFormat<CR>', { desc = '[jq] Pretty Print' })
