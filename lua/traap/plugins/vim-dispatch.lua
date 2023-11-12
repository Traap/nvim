require("traap.core.globals")

local plugin = "vim-dispatch"

if Is_Enabled(plugin) then
  Keymap("n", "<leader>tao",   "<cmd>Dispatch!ao ao<cr>")
  Keymap("n", "<leader>tbash", "<cmd>Dispatch!ao bash<cr>")
  Keymap("n", "<leader>tkjv",  "<cmd>Dispatch!ao kjv<cr>")
  Keymap("n", "<leader>tssh",  "<cmd>Dispatch!ao ssh<cr>")
  Keymap("n", "<leader>tsoup", "<cmd>Dispatch!ao soup<cr>")
  Keymap("n", "<leader>tvim",  "<cmd>Dispatch!ao vim<cr>")
  Keymap("n", "<leader>twiki", "<cmd>Dispatch!ao wiki<cr>")

  Keymap("n", "<leader>kao",   "<cmd>Dispatch! tmux kill-session -t ao<cr>")
  Keymap("n", "<leader>kbash", "<cmd>Dispatch! tmux kill-session -t bash<cr>")
  Keymap("n", "<leader>kkjv",  "<cmd>Dispatch! tmux kill-session -t kjv<cr>")
  Keymap("n", "<leader>kssh",  "<cmd>Dispatch! tmux kill-session -t ssh<cr>")
  Keymap("n", "<leader>ksoup", "<cmd>Dispatch! tmux kill-session -t soup<cr>")
  Keymap("n", "<leader>kvim",  "<cmd>Dispatch! tmux kill-session -t vim<cr>")
  Keymap("n", "<leader>kwiki", "<cmd>Dispatch! tmux kill-session -t wiki<cr>")
end

return {
  "tpope/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
}
