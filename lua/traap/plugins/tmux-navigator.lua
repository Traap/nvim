local platform = require("traap.core.platform")

local directions = {
  left  = { herdr = "left", tmux = "Left", wincmd = "h" },
  down  = { herdr = "down", tmux = "Down", wincmd = "j" },
  up    = { herdr = "up", tmux = "Up", wincmd = "k" },
  right = { herdr = "right", tmux = "Right", wincmd = "l" },
}

local function navigate(direction)
  local target = directions[direction]
  local current_win = vim.api.nvim_get_current_win()

  vim.cmd("wincmd " .. target.wincmd)

  if vim.api.nvim_get_current_win() ~= current_win then
    return
  end

  if platform.in_herdr() then
    local herdr = vim.env.HERDR_BIN_PATH or "herdr"
    vim.fn.system({
      herdr, "pane", "focus", "--direction", target.herdr, "--current",
    })
    return
  end

  if platform.in_tmux() then
    vim.cmd("TmuxNavigate" .. target.tmux)
  end
end

return {
  "christoomey/vim-tmux-navigator",
  enabled = true and platform.is_nvim(),
  keys = {
    { "<c-h>", function() navigate("left") end,  desc = "Navigate Left", },
    { "<c-j>", function() navigate("down") end,  desc = "Navigate Down", },
    { "<c-k>", function() navigate("up") end,    desc = "Navigate Up", },
    { "<c-l>", function() navigate("right") end, desc = "Navigate Right", },
  },
  init = function()
    vim.g.tmux_navigator_no_mappings = 1
    vim.g.tmux_navigator_disable_when_zoomed = 1
    vim.g.tmux_navigator_preserve_zoom = 1
  end,
}
