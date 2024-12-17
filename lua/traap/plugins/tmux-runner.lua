return {
  "Traap/vim-tmux-runner",
  enabled = true and os.getenv('TMUX') ~= nil,
  event = require("traap.config.events").file,

  keys = {
    {"<leader>tC", "<cmd>VtrClearRunner<cr>", desc = "Clear Tmux Runner"},
    {"<leader>tF", "<cmd>VtrFocusRunner<cr>", desc = "Focus Tmux Runner"},
    {"<leader>tR", "<cmd>VtrReorientRunner<cr>", desc = "Reorient Tmux Runner"},
    {"<leader>ta", "<cmd>VtrReattachRunner<cr>", desc = "Reattach Tmux Runner"},
    {"<leader>tc", "<cmd>VtrFlushCommand<cr>", desc = "Flush Tmux Runner Command"},
    {"<leader>tf", "<cmd>VtrSendFile<cr>", desc = "Send File to Tmux Runner"},
    {"<leader>tk", "<cmd>VtrKillRunner<cr>", desc = "Kill Tmux Runner"},
    {"<leader>tl", "<cmd>VtrSendLinesToRunner<cr>", "desc = Send Lines to Tmux Runner"},
    {"<leader>to", "<cmd>VtrOpenRunner {'orientation': 'h', 'percentage': 50}<cr>", desc = "Open Tmux Runner"},
    {"<leader>tr", "<cmd>VtrResizeRunner<cr>", desc = "Resize Tmux Runner"},
    {"<leader>ts", "<cmd>VtrSendCommandToRunner<cr>", desc = "Send Command to Tmux Runner"},
  }
}
