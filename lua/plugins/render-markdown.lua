return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        -- Don't hide concealed text while rendering. Combined with the json
        -- highlights override in queries/json/highlights.scm, this keeps quotes
        -- visible inside json code blocks. Note: this also disables hiding of
        -- raw markdown markup (e.g. **bold** markers, link URLs).
        win_options = {
            conceallevel = { rendered = 0 },
        },
    },
}
