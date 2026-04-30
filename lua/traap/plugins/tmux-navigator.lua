local platform = require("traap.core.platform")
return {
  "christoomey/vim-tmux-navigator",
  enabled = true and platform.is_nvim(),
  init = function()
    vim.g.tmux_navigator_disable_when_zoomed = 1
    vim.g.tmux_navigator_preserve_zoom = 1
  end,
}
