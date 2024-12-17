return {
  "Traap/vim-bundle-tmux-runner",
  enabled = true and os.getenv('TMUX') ~= nil,
  event = require("traap.config.events").file,
  dependencies = {
    "Traap/vim-tmux-runner",
  },
}
