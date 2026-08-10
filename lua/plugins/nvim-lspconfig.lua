-- File: lua/plugins/lsp.lua
return {
  -- Main plugin for LSP configuration
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Dependency for autocompletion capabilities
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    -- Diagnostic display is global state, not per-buffer or per-client.
    vim.diagnostic.config({
      virtual_text = { spacing = 2 },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })

    vim.lsp.config('gopls', {
      -- Pass capabilities from cmp-nvim-lsp
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      settings = {
        gopls = {
          staticcheck = true,
        },
      },
    })
    vim.lsp.config('ruby_lsp', {
      init_options = {
        formatter = 'standard',
        linters = { 'standard' },
      },
    })
    vim.lsp.config('pyright', {})
    vim.lsp.config('rust_analyzer', {})
    vim.lsp.config('terraformls', {})
    vim.lsp.config('tflint', {})
  end
}
