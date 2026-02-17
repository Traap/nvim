return {
  "kndndrj/nvim-dbee",
  enabled = true,
  ft = { 'sql', 'mysql', 'plsql' },
  lazy = true,
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  build = function()
    require("dbee").install()
  end,
  config = function()
    local dbee = require("dbee")

    dbee.setup({
      ui = {
        border = "rounded",
        icons = {
          expanded = "▾",
          collapsed = "▸",
        },
      },
    })

    vim.keymap.set("n", "<leader>db", function()
      vim.cmd("Dbee open")
    end, { desc = "Open DB client (nvim-dbee)" })
  end,
}
