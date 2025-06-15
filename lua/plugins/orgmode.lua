return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = {'~/code/org/*.org'},
      org_default_notes_file = '~/code/org/default.org',
      org_capture_templates = {
       t = {
         description = 'Task',
         template = '* TODO %?\n  %u',
         target = '~/code/org/tasks.org',
       },
       n = {
         description = 'Note',
         template = '* %u %?\n',
         target = '~/code/org/notes.org',
       },
      },
    })

    -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
    -- add ~org~ to ignore_install
    -- require('nvim-treesitter.configs').setup({
    --   ensure_installed = 'all',
    --   ignore_install = { 'org' },
    -- })
  end,
}
