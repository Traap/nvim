return {
  "kristijanhusak/vim-dadbod-ui",

  enabled = true,

  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion",
      ft = { "sql", "mysql", "plsql" }, lazy = true
    }, -- Optional
  },

  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },

  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_auto_execute_table_helpers = 1
    vim.g.db_ui_table_helpers = {
      sqlserver = {
        Count = "select count(*) from {table}"
      }
    }
  end,
}
