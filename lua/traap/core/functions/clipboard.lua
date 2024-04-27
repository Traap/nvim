-- wsl clipboard setup
-- https://mitchellt.com/2022/05/15/WSL-Neovim-Lua-and-the-Windows-Clipboard.html See

local in_wsl = os.getenv('WSL_DISTRO_NAME') ~= nil

if in_wsl then
  vim.g.clipboard = {
    name = 'wsl clipboard',
    copy =  {
      ["+"] = { "clip.exe" },
      ["*"] = { "clip.exe" }
    },
    paste = {
      ["+"] = { "nvim-paste" },
      ["*"] = { "nvim-paste" }
    },
    cache_enabled = true
  }
end
