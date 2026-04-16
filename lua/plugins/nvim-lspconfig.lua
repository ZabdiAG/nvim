-- File: lua/plugins/lsp.lua
return {
  -- Main plugin for LSP configuration
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Dependency for autocompletion capabilities
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    vim.lsp.config('gopls', {
      -- Pass capabilities from cmp-nvim-lsp
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      -- The on_attach function remains the same
      on_attach = function(client, bufnr)
        -- Configure diagnostic behavior
        vim.diagnostic.config({
          virtual_text = { spacing = 2, severity_sort = true },
          signs = true,
          underline = true,
          update_in_insert = false,
          severity = {
            min = vim.diagnostic.severity.HINT,
          },
        }, bufnr)
      end,
      settings = {
        golang = {
          gopls = {
            staticcheck = true,
          },
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
