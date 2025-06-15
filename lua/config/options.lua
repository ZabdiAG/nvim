
-- Set editor options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamed"
vim.opt.colorcolumn = "120"
vim.opt.termguicolors = true -- Essential for modern colorschemes

-- Tab characters
vim.opt.list = true
vim.opt.listchars = { tab = '▸·' }

-- Global variables for plugins
vim.g.sql_type_default = 'pgsql'
vim.g.vim_json_conceal = 0 -- Disable quote concealing in JSON
