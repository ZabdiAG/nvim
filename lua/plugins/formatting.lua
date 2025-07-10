-- lua/plugins/formatting.lua (or wherever you manage your plugins)
return {
  'stevearc/conform.nvim',
  lazy = false, -- conform.nvim needs to be loaded early for format-on-save
  keys = {
    {
      '<leader>fm',
      function()
        require('conform').format({ async = true, lsp_format = 'fallback' })
      end,
      mode = 'n',
      desc = 'Format buffer',
    },
  },
  opts = {
    -- This is where you configure formatters
    formatters_by_ft = {
      go = { 'goimports', 'gofumpt' }, -- We'll define these below
      ruby = { 'rubocop' },
      proto = { 'buf' },
      -- You can add other languages here
      -- lua = { 'stylua' },
      -- python = { 'black' },
      -- ...
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 500, lsp_format = 'fallback' },
    -- You can also set a default formatter for specific filetypes if needed
    -- formatters = {
    --   goimports = {
    --     -- args = { '-local', 'github.com/your-org' }, -- Example: for goimports -local flag
    --   },
    -- },
    formatters = {
      rubocop = {
      -- You can add extra arguments here.  For example, to use a specific config file:
      extra_args = { "--config", vim.fn.getcwd() .. "/.rubocop.yml" },
      -- Or to fully override the arguments:
      -- args = { "--server", "-f", "quiet", "--stderr", "--stdin" },
      },
    },
      buf = {},
  },
}
