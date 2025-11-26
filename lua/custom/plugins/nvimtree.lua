-- https://github.com/nvim-tree/nvim-tree.lua
--
-- For now lets get it set up like "Neovim IDE from Scratch", where I first got
-- accustomed to having this plugin.
--
return {
  {
    'nvim-tree/nvim-tree.lua',
    version = 'v1.14.0',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local icons = require 'custom.icons'

      require('nvim-tree').setup {
        disable_netrw = true,
        hijack_netrw = true,
        sync_root_with_cwd = true,
        view = {
          relativenumber = false,
        },
        renderer = {
          add_trailing = false,
          group_empty = false,
          highlight_git = false,
          full_name = false,
          highlight_opened_files = 'none',
          root_folder_label = ':t',
          indent_width = 2,
          indent_markers = {
            enable = vim.g.have_nerd_font,
            inline_arrows = true,
          },
          icons = {
            git_placement = 'before',
            padding = ' ',
            symlink_arrow = ' ➛ ',
            glyphs = {
              default = icons.ui.Text,
              symlink = icons.ui.FileSymlink,
              bookmark = icons.ui.BookMark,
              folder = {
                arrow_closed = icons.ui.ChevronRight,
                arrow_open = icons.ui.ChevronShortDown,
                default = icons.ui.Folder,
                open = icons.ui.FolderOpen,
                empty = icons.ui.EmptyFolder,
                empty_open = icons.ui.EmptyFolderOpen,
                symlink = icons.ui.FolderSymlink,
                symlink_open = icons.ui.FolderOpen,
              },
              git = {
                unstaged = icons.git.FileUnstaged,
                staged = icons.git.FileStaged,
                unmerged = icons.git.FileUnmerged,
                renamed = icons.git.FileRenamed,
                untracked = icons.git.FileUntracked,
                deleted = icons.git.FileDeleted,
                ignored = icons.git.FileIgnored,
              },
            },
          },
          special_files = { 'Cargo.toml', 'Makefile', 'README.md', 'readme.md' },
          symlink_destination = true,
        },
        update_focused_file = {
          enable = true,
          debounce_delay = 15,
          update_root = true,
          ignore_list = {},
        },

        diagnostics = {
          enable = true,
          show_on_dirs = false,
          show_on_open_dirs = true,
          debounce_delay = 50,
          severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR,
          },
          icons = {
            hint = icons.diagnostics.BoldHint,
            info = icons.diagnostics.BoldInformation,
            warning = icons.diagnostics.BoldWarning,
            error = icons.diagnostics.BoldError,
          },
        },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
