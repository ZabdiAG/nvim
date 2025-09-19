return {
  'tpope/vim-fugitive',
  lazy = false,
  keys = {
    { '<leader>gg', ':G<CR>', desc = 'Fugitive: Git status (short)', mode = 'n' },
    { '<leader>gs', ':Git status<CR>', desc = 'Fugitive: Git status', mode = 'n' },
    { '<leader>gl', ':Git log<CR>', desc = 'Fugitive: Git log', mode = 'n' },
    { '<leader>gd', ':Git diff<CR>', desc = 'Fugitive: Git diff', mode = 'n' },
    { '<leader>gdb', ':Git diff %<CR>', desc = 'Fugitive: Git diff buffer', mode = 'n' },
    { '<leader>gds', ':Git diff --staged<CR>', desc = 'Fugitive: Git diff staged', mode = 'n' },
    { '<leader>gdsb', ':Git diff --staged %<CR>', desc = 'Fugitive: Git diff staged buffer', mode = 'n' },
    { '<leader>ga', ':Git add %<CR>', desc = 'Fugitive: Git add buffer', mode = 'n' },
    { '<leader>gb', ':Git blame<CR>', desc = 'Fugitive: Git blame', mode = 'n' },
  },
}
