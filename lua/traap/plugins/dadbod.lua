local platform = require("traap.core.platform")
return {
  'kristijanhusak/vim-dadbod-ui',
  enabled = true and platform.is_nvim(),

  -- event = require("traap.config.events").file,
  lazy = true,

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
    local repoRoot = nil
    if require('traap.core.working').at_home() then
      repoRoot = vim.fn.getenv('GITHOME')
    else
      repoRoot = vim.fn.getenv('WORKHOME')
    end

    vim.g.db_ui_save_location = repoRoot
    vim.g.db_ui_tmp_query_location = repoRoot .. "/tmp"

    vim.g.db_ui_auto_execute_table_helpers = true
    vim.g.db_ui_enable_query_history = true
    vim.g.db_ui_show_database_icon = true
    vim.g.db_ui_use_nerd_fonts = true
    vim.g.db_ui_use_nvim_notify = true
    vim.g.db_ui_ui_execute_on_save = false
    vim.g.db_ui_win_position = 'right'

    vim.g.db_ui_table_helpers = {
      sqlserver = {
         Count = 'select count(*) from {table}'
        ,Top10 = 'select top 10 * from {table}'
        ,ColumnInfo = 'exec sp_columns {table}'
      }
    }
  end,
}
