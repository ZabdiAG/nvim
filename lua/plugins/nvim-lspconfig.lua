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
        -- Key mappings specific to the LSP buffer
        vim.keymap.set('n', '<leader>ds', vim.diagnostic.open_float, { buffer = bufnr, desc = 'Show diagnostics' })
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { buffer = bufnr, desc = 'Go to previous diagnostic' })
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = bufnr, desc = 'Go to next diagnostic' })
        vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { buffer = bufnr, desc = 'Show diagnostics in quickfix' })

        -- Configure diagnostic signs
        vim.fn.sign_define('LspDiagnosticsSignError', { text = 'E', texthl = 'DiagnosticSignError' })
        vim.fn.sign_define('LspDiagnosticsSignWarning', { text = 'W', texthl = 'DiagnosticSignWarn' })
        vim.fn.sign_define('LspDiagnosticsSignHint', { text = 'H', texthl = 'DiagnosticSignHint' })
        vim.fn.sign_define('LspDiagnosticsSignInfo', { text = 'I', texthl = 'DiagnosticSignInfo' })

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
  end
}
