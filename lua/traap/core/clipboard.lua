-- lua/config/clipboard.lua

local clipboard = {}

local function executable(cmd)
  return vim.fn.executable(cmd) == 1
end

-- Detect environment
local function in_wsl()
  local uname = vim.loop.os_uname().release
  return uname:lower():find("microsoft") ~= nil
end

local function is_wayland()
  return vim.env.WAYLAND_DISPLAY ~= nil
end

local function is_git_bash()
  return vim.fn.has("win32") == 1 and vim.env.MSYSTEM ~= nil
end

-- Configure clipboard
if in_wsl() and is_wayland() then
   -- WSLg clipboard (native)
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
    cache_enabled = false
  }

elseif is_git_bash() then
  -- Git Bash (limited or manual setup)
  print("[nvim] Git Bash detected. Clipboard support may be limited.")

elseif is_wayland() then
  -- Wayland (Hyprland)
  if executable("wl-copy") and executable("wl-paste") then
    vim.g.clipboard = "wl-copy"
  end

else
  -- X11 (BSPWM)
  if executable("xclip") then
    vim.g.clipboard = {
      name = "xclip",
      copy = {
        ["+"] = "xclip -selection clipboard",
        ["*"] = "xclip -selection primary",
      },
      paste = {
        ["+"] = "xclip -selection clipboard -o",
        ["*"] = "xclip -selection primary -o",
      },
      cache_enabled = false,
    }
  elseif executable("xsel") then
    vim.g.clipboard = {
      name = "xsel",
      copy = {
        ["+"] = "xsel --clipboard --input",
        ["*"] = "xsel --primary --input",
      },
      paste = {
        ["+"] = "xsel --clipboard --output",
        ["*"] = "xsel --primary --output",
      },
      cache_enabled = false,
    }
  end
end

return clipboard
