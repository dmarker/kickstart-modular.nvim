-- [[ Basic Keymaps ]]
--  See `:help kmap()`
local kmap = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
kmap('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
kmap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
kmap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
kmap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
kmap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
kmap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
kmap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- bufferline
kmap('n', '<S-l>', '<cmd> BufferLineCycleNext <CR>') --"<U+F138>  cycle next buffer"
kmap('n', '<S-h>', '<cmd> BufferLineCyclePrev <CR>') --"<U+F137>  cycle prev buffer"
kmap('n', '<leader>l', '<cmd> BufferLineMoveNext <CR>') --"<U+F138>  cycle next buffer"
kmap('n', '<leader>h', '<cmd> BufferLineMovePrev <CR>') --"<U+F137>  cycle prev buffer"
-- vim.keymap.set('n', '<A-f>', '<cmd> BufferLinePick <CR>')
kmap('n', '<S-b>', '<cmd> enew <CR>') --"new buffer"
kmap('n', '<S-q>', '<cmd> bp|sp|bn|bd! <CR>')

-- resize with arrows
kmap('n', '<C-Up>', ':resize -2<CR>', { noremap = true, silent = true })
kmap('n', '<C-Down>', ':resize +2<CR>', { noremap = true, silent = true })
kmap('n', '<C-Left>', ':vertical resize -2<CR>', { noremap = true, silent = true })
kmap('n', '<C-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true })

-- toggle line numbers
kmap('n', '<leader>n', function()
  vim.opt.number = not vim.opt.number:get()
end, { desc = 'Toggle line [n]umbers' })

-- I initially thought this was vim.opt.breakat but its not.
-- `iskeyword` is what we are after but really just for lispy (at present just
-- janet) languages.
vim.filetype.add {
  extension = {
    janet = function(_, _)
      vim.opt_local.iskeyword:append { '-' }
      return 'janet'
    end,
  },
}

-- lazygit
kmap('n', '<leader>lg', ':LazyGit<CR>', { desc = "LazyGit" })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- kmap("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- kmap("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- kmap("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- kmap("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- ToggleTerm fixes so I don't go crazy
-- see https://github.com/NotAShelf/neovim-flake/issues/69#issuecomment-1533410759
-- Note <C-Space> is an apple thing and won't go away but that was never my issue.
for wrong, correct in pairs {
  ['<S-BS>'] = '<BS>',
  ['<C-BS>'] = '<BS>',
  ['<M-S-BS>'] = '<BS>',
  ['<M-C-BS>'] = '<BS>',
  ['<C-S-BS>'] = '<BS>',
  ['<M-C-S-BS>'] = '<BS>',
  ['<S-Space>'] = '<Space>',
  ['<C-Space>'] = '<Space>',
  ['<M-S-Space>'] = '<Space>',
  ['<M-C-Space>'] = '<Space>',
  ['<C-S-Space>'] = '<Space>',
  ['<M-C-S-Space>'] = '<Space>',
  ['<S-CR>'] = '<CR>',
  ['<C-CR>'] = '<CR>',
  ['<M-S-CR>'] = '<CR>',
  ['<M-C-CR>'] = '<CR>',
  ['<C-S-CR>'] = '<CR>',
  ['<M-C-S-CR>'] = '<CR>',
} do
  kmap('t', wrong, correct, { noremap = true })
end

-- vim: ts=2 sts=2 sw=2 et
