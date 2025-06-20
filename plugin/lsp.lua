-- https://github.com/neovim/nvim-lspconfig
-- Setup language servers.

vim.lsp.enable('gopls')

local lspconfig = require('lspconfig')

lspconfig.gopls.setup {
  capabilities = require('cmp_nvim_lsp').default_capabilities(), -- If you're using cmp for autocompletion
  on_attach = function(client, bufnr)
    -- Enable key mappings specific to this buffer for LSP
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { buffer = bufnr, desc = 'Show diagnostics' })
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { buffer = bufnr, desc = 'Go to previous diagnostic' })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = bufnr, desc = 'Go to next diagnostic' })
    vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { buffer = bufnr, desc = 'Show diagnostics in quickfix' })

    -- Configure diagnostic signs (the little markers in the gutter)
    vim.fn.sign_define('LspDiagnosticsSignError', { text = 'E', texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('LspDiagnosticsSignWarning', { text = 'W', texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('LspDiagnosticsSignHint', { text = 'H', texthl = 'DiagnosticSignHint' })
    vim.fn.sign_define('LspDiagnosticsSignInfo', { text = 'I', texthl = 'DiagnosticSignInfo' })

    vim.diagnostic.config({
      virtual_text = { spacing = 2, severity_sort = true }, -- Show diagnostics inline (optional)
      signs = true, -- Show diagnostics in the sign column (gutter)
      underline = true, -- Underline diagnostic text (optional)
      update_in_insert = false, -- Only update diagnostics when leaving insert mode (performance)
      severity = {
        min = vim.diagnostic.severity.HINT, -- Show all diagnostic levels by default
      },
    }, bufnr)
  end,
  settings = {
    golang = {
      gopls = {
        -- Add any specific gopls settings here
        -- For example, to enable staticcheck:
        staticcheck = true,
        -- Or to configure build flags:
        --buildFlags = ["-tags=integration"],
      },
    },
  },
}


lspconfig.ruby_lsp.setup({
  init_options = {
    formatter = 'standard',
    linters = { 'standard' },
  },
})

vim.lsp.enable('pyright')

vim.lsp.enable('rust_analyzer')

-- vim.lsp.config('rust_analyzer', {
--   -- Server-specific settings. See `:help lsp-quickstart`
--   settings = {
--     ['rust-analyzer'] = {},
--   },
-- })
