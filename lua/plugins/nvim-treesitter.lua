return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", "go", "python", "rust", "json", "yaml" },
      highlight = { enable = true },
      indent = { enable = true },
      -- This replaces your manual fold settings
      folding = {
        enable = true,
      },
    })

    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

    --Folding configuration, automatically folds file when open
    --https://stackoverflow.com/questions/78077278/treesitter-and-syntax-folding
    --set nofoldenable                     " Disable folding at startup.
    --set foldcolumn=1 		     " Show fold column

    -- You can add a keymap to toggle folds
    vim.keymap.set("n", "za", "za", { desc = "Toggle fold" })
  end,
}

