-- `gopls` doesn't appear to have any support for "per project" settings. Odd
-- given that buid constraints are very much project dependent.
--
-- The nice thing is we are not trying to do the complicated `root_dir` function
-- like nvim-lspconfig/lsp/gopls.lua.
--
-- "Per projecte" means something much simpler: work up directory tree to a
-- directory with `.git`.
--
-- Read a `.gopls.json` file located by .git if we have one.
--
-- When working on this I found changing the return to a `vim.print` and running
--    /usr/bin/env -S nvim -l ~/.config/nvim/after/lua/gopls.lua
-- very helpful. In fact sprintkle in `vim.print(var)` as useful...
--
-- Simple example `.gopls.json` file:
--  { "buildFlags":  ["-tags=foo"] }
--
-- As long as you provide valid json that gets parsed and matches the spec (see
-- https://go.dev/gopls/settings) it will be passed along.

local function project_gopls_settings()
  local root = vim.fs.root(0, '.git')
  if not root then
    return {}
  end

  local file = io.open(root .. '/.gopls.json', 'r')
  if not file then
    return {}
  end

  local content = file:read '*a' -- read entire file
  file:close()

  local data = vim.json.decode(content)

  if next(data) == nil then
    return {}
  end

  -- it must be inside these outer layers:
  return { settings = { gopls = data } }
end

-- vim.print(project_gopls_settings())
return project_gopls_settings()
-- vim: ts=2 sts=2 sw=2 et
