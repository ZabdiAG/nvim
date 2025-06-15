local function set_tabs(width, use_spaces)
  vim.bo.tabstop = width
  vim.bo.shiftwidth = width
  -- For hard tabs, softtabstop should often match tabstop
  -- For soft tabs (spaces), it's often 0 or matching shiftwidth
  vim.bo.softtabstop = use_spaces and 0 or width
  vim.bo.expandtab = use_spaces
end

-- Create an autocommand group to house all our ft settings
local ft_group = vim.api.nvim_create_augroup('FileTypeSettings', { clear = true })

-- Define settings for each filetype
vim.api.nvim_create_autocmd('FileType', {
  group = ft_group,
  pattern = 'javascript,json,ruby,lua,html,org',
  callback = function()
    set_tabs(2, true) -- 2 spaces
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = ft_group,
  pattern = 'python',
  callback = function()
    set_tabs(4, true) -- 4 spaces
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = ft_group,
  pattern = 'go',
  callback = function()
    set_tabs(4, false) -- 4-width hard tabs
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = ft_group,
  pattern = 'vim',
  callback = function()
    set_tabs(2, false) -- 2-width hard tabs
  end,
})
