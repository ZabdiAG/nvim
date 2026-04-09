return {
  "hashivim/vim-terraform",
  ft = { "terraform", "hcl" },
  config = function()
    -- Enable terraform alignment on save
    vim.g.terraform_align = 1
  end,
}
