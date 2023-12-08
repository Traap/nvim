return {
  "mfussenegger/nvim-dap",
  enabled = true,
  keys = {
    { "<leader>dC", [[<cmd>lua require("dap").run_to_cursor()<cr>]] },
    { "<leader>db", [[<cmd>lua require("dap").step_back()<cr>]] },
    { "<leader>dc", [[<cmd>lua require("dap").continue()<cr>]] },
    { "<leader>dd", [[<cmd>lua require("dap").disconnect()<cr>]] },
    { "<leader>dg", [[<cmd>lua require("dap").session()<cr>]] },
    { "<leader>di", [[<cmd>lua require("dap").step_into()<cr>]] },
    { "<leader>dl", [[<cmd>lua require("dap").open_logfile()<cr>]] },
    { "<leader>do", [[<cmd>lua require("dap").step_over()<cr>]] },
    { "<leader>dp", [[<cmd>lua require("dap").pause()<cr>]] },
    { "<leader>dq", [[<cmd>lua require("dap").close()<cr>]] },
    { "<leader>ds", [[<cmd>lua require("dap").continue()<cr>]] },
    { "<leader>dr", [[<cmd>lua require("dap").repl.toggle()<cr>]] },
    { "<leader>dt", [[<cmd>lua require("dap").toggle_breakpoint()<cr>]] },
    { "<leader>dw", [[<cmd>lua require("dap.ui.widgets").hover()<cr>]] },

    { "<leader>Dd", [[<cmd>lua require("osv").run_this()<cr>]] },
    { "<leader>Ds", [[<cmd>lua require("osv").launch({ port = 8686})<cr>]] },

    {       "<F5>", [[<cmd>lua require("dap").continue()<cr>]] },
    {      "<F10>", [[<cmd>lua require("dap").step_over()<cr>]] },
    {      "<F11>", [[<cmd>lua require("dap").step_into()<cr>]] },
    {      "<F12>", [[<cmd>lua require("dap").step_out()<cr>]] },
  },
}
