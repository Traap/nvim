return {
  'kristijanhusak/vim-dadbod-ui',
  event = require("traap.config.events").file,
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion',
       ft = { 'sql', 'mysql', 'plsql' },
       lazy = true,
    },
  },

  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },

  keys = {
    { "<leader>db", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI" },
  },

  init = function()
    local db_ui_save_location = vim.fn.getenv('GITHOME')
    if not require('traap.core.working').at_home then
      db_ui_save_location = vim.fn.getenv('WORKHOME')
    end

    vim.g.db_ui_save_location = db_ui_save_location
    vim.g.db_ui_tmp_query_location = db_ui_save_location .. "/tmp"

    vim.g.db_ui_auto_execute_table_helpers = true
    vim.g.db_ui_enable_query_history = true
    vim.g.db_ui_show_database_icon = true
    vim.g.db_ui_use_nerd_fonts = true
    vim.g.db_ui_use_nvim_notify = true
    vim.g.db_ui_ui_execute_on_save = false

    vim.g.db_ui_table_helpers = {
      sqlserver = {
         Count = 'select count(*) from {table}'
        ,Top10 = 'select top 10 * from {table}'
        ,ColumnInfo = 'exec sp_columns {table}'
      }
    }
  end,
}
