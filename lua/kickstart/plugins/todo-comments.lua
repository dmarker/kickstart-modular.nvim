-- Highlight todo, notes, etc in comments
-- bug in v1.3.0 see https://github.com/folke/todo-comments.nvim/issues/302
-- Actually not causing me issues.
-- Don't want to require ':' after a keyword.
return {
  {
    'folke/todo-comments.nvim',
    -- version = 'v1.2.0',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = false,
      highlight = {
        keyword = 'bg',
        pattern = [[.*<(KEYWORDS)\s*]],
      },
      search = {
        pattern = [[\b(KEYWORDS)\b]],
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
