require("config.globals")

local plugin = "vim-tmux-runner"

return {
  "christoomey/" .. plugin,
  enabled = Is_Enabled(plugin) and In_Tmux(),
  event = "VeryLazy",
  keys = {
    {"<leader>tC", "<cmd>VtrClearRunner<cr>", "Clear Tmux Runner"},
    {"<leader>tF", "<cmd>VtrFocusRunner<cr>", "Focus Tmux Runner"},
    {"<leader>tR", "<cmd>VtrReorientRunner<cr>", "Reorient Tmux Runner"},
    {"<leader>ta", "<cmd>VtrReattachRunner<cr>", "Reattach Tmux Runner"},
    {"<leader>tc", "<cmd>VtrFlushCommand<cr>", "Flush Tmux Runner Command"},
    {"<leader>tf", "<cmd>VtrSendFile<cr>", "Send File to Tmux Runner"},
    {"<leader>tk", "<cmd>VtrKillRunner<cr>", "Kill Tmux Runner"},
    {"<leader>tl", "<cmd>VtrSendLinesToRunner<cr>", "Send Lines to Tmux Runner"},
    {"<leader>to", "<cmd>VtrOpenRunner {'orientation': 'h', 'percentage': 50}<cr>", "Open Tmux Runner"},
    {"<leader>tr", "<cmd>VtrResizeRunner<cr>", "Resize Tmux Runner"},
    {"<leader>ts", "<cmd>VtrSendCommandToRunner<cr>", "Send Command to Tmux Runner"},
  }
}
