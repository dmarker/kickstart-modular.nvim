-- Good sample config in
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/clangd.lua
-- or since you installed nvim-lspconfig for basics:
--  ~/.local/share/nvim/lazy/nvim-lspconfig/lsp/clangd.lua
--
-- why didn't that have 'h' files?

-- change this based on which devel/llvm you installed to get a clangd
if vim.uv.os_uname().sysname:match 'FreeBSD' then
  return {
    cmd = { 'clangd20' },
    filetypes = { 'h', 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
  }
else
  return {
    cmd = { 'clangd' },
    filetypes = { 'h', 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
  }
end

-- vim: ts=2 sts=2 sw=2 et
