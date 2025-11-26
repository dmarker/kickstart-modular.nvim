-- For FreeBSD we still have packages for lua51 and luarocks (select LUAJIT).
-- But for everything else just let this try and handle it.

if vim.uv.os_uname().sysname:match 'FreeBSD' then
  return {}
else
  return {
    {
      "vhyrro/luarocks.nvim",
      priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
      config = true,
    }
  }
end

-- vim: ts=2 sts=2 sw=2 et
