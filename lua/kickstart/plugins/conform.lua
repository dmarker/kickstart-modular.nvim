return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    config = function()
      -- This is reason we changed to function. To deal with neovim borked ass lua shit
      local f = {
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        -- go = { "goimports", "gofmt" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      }
      if vim.g.sysname ~= 'FreeBSD' then
        -- only add lua when not on FreeBSD
        f.lua = { 'stylua' }
      end
      require('conform').setup {
        notify_on_error = false,
        format_on_save = function(bufnr)
          -- Disable "format_on_save lsp_fallback" for languages that don't
          -- have a well standardized coding style. You can add additional
          -- languages here or re-enable it for the disabled ones.
          local disable_filetypes = { c = true, cpp = true }
          return {
            timeout_ms = 500,
            lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
          }
        end,
        formatters_by_ft = f,
      }
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
