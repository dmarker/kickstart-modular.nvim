-- https://github.com/akinsho/toggleterm.nvim
--
-- For now lets get it set up like "Neovim IDE from Scratch", where I first got
-- accustomed to having this plugin.
--
-- They did more with it like htop, but I just want a terminal that floats when I type CTRL-\

return {
  {
    'akinsho/toggleterm.nvim',
    -- version = 'v2.13.1',
    opts = {
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = 'float',
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = 'curved',
        winblend = 0,
        highlights = {
          border = 'Normal',
          background = 'Normal',
        },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
