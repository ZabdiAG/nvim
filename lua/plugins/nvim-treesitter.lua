return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({})

    -- Install parsers if missing
    local ensure_installed = {
      "c",
      "lua",
      "vim",
      "vimdoc",
      "javascript",
      "html",
      "go",
      "python",
      "rust",
      "json",
      "yaml",
      "terraform",
      "hcl",
      "starlark"
    }

    local installed = require("nvim-treesitter").get_installed()
    local to_install = vim.tbl_filter(function(lang)
      return not vim.tbl_contains(installed, lang)
    end, ensure_installed)
    if #to_install > 0 then
      require("nvim-treesitter").install(to_install)
    end

    -- Enable treesitter features per filetype
    vim.api.nvim_create_autocmd("FileType", {
      pattern = ensure_installed,
      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      end,
    })
  end,
}
