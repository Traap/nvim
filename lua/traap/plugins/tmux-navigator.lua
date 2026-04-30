local platform = require("traap.core.platform")
return {
  "christoomey/vim-tmux-navigator",
  enabled = true and platform.is_nvim(),
}
