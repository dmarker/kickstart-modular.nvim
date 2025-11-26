-- https://github.com/akinsho/bufferline.nvim
--
-- For now lets get it set up like "Neovim IDE from Scratch", where I first got
-- accustomed to having this plugin.
--
-- TODO: cleanup, I have mouse off so some of this config is unnecessary!
-- NOTE there is known bug for `nvim .` https://github.com/akinsho/bufferline.nvim/issues/869
return {
  {
    'akinsho/bufferline.nvim',
    version = 'v4.9.1',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local icons = require 'custom.icons'

      require('bufferline').setup {
        options = {
          close_command = 'bp|sp|bn|bd! %d',
          right_mouse_command = 'bp|sp|bn|bd! %d',
          left_mouse_command = 'buffer %d',
          buffer_close_icon = icons.ui.BoldClose,
          modified_icon = icons.git.FileUnstaged,
          close_icon = icons.ui.BoldClose,
          show_close_icon = false,
          left_trunc_marker = icons.ui.ArrowCircleLeft,
          right_trunc_marker = icons.ui.ArrowCircleRight,
          max_name_length = 30,
          max_prefix_length = 30,
          tab_size = 21,
          show_tab_indicators = true,
          indicator = {
            style = 'none',
          },
          enforce_regular_tabs = false,
          view = 'multiwindow',
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          offsets = {
            {
              filetype = 'NvimTree',
              text = '',
              padding = 1,
            },
          },
          -- separator_style = 'thin',
          separator_style = 'slant',
          always_show_bufferline = true,
          diagnostics = false,
          themable = true,
        },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
