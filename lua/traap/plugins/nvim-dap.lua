require("traap.core.globals")

local plugin = "nvim-dap"

if Is_Enabled(plugin) then
  Keymap("n", "<leader>dC", [[<cmd>lua require("dap").run_to_cursor()<cr>]])
  Keymap("n", "<leader>db", [[<cmd>lua require("dap").step_back()<cr>]])
  Keymap("n", "<leader>dc", [[<cmd>lua require("dap").continue()<cr>]])
  Keymap("n", "<leader>dd", [[<cmd>lua require("dap").disconnect()<cr>]])
  Keymap("n", "<leader>dg", [[<cmd>lua require("dap").session()<cr>]])
  Keymap("n", "<leader>di", [[<cmd>lua require("dap").step_into()<cr>]])
  Keymap("n", "<leader>dl", [[<cmd>lua require("dap").open_logfile()<cr>]])
  Keymap("n", "<leader>do", [[<cmd>lua require("dap").step_over()<cr>]])
  Keymap("n", "<leader>dp", [[<cmd>lua require("dap").pause()<cr>]])
  Keymap("n", "<leader>dq", [[<cmd>lua require("dap").close()<cr>]])
  Keymap("n", "<leader>ds", [[<cmd>lua require("dap").continue()<cr>]])
  Keymap("n", "<leader>dr", [[<cmd>lua require("dap").repl.toggle()<cr>]])
  Keymap("n", "<leader>dt", [[<cmd>lua require("dap").toggle_breakpoint()<cr>]])

  Keymap("n", "<leader>dw", [[<cmd>lua require("dap.ui.widgets").hover()<cr>]])
  Keymap("n", "<leader>Dd", [[<cmd>lua require("osv").run_this()<cr>]])
  Keymap(
    "n",
    "<leader>Ds",
    [[<cmd>lua require("osv").launch({ port = 8686})<cr>]]
  )

  Keymap("n", "<F5>", [[<cmd>lua  require("dap").continue()<cr>]])
  Keymap("n", "<F10>", [[<cmd>lua require("dap").step_over()<cr>]])
  Keymap("n", "<F11>", [[<cmd>lua require("dap").step_into()<cr>]])
  Keymap("n", "<F12>", [[<cmd>lua require("dap").step_out()<cr>]])
end

return {
  "mfussenegger/" .. plugin,
  enabled = Is_Enabled(plugin),
}
