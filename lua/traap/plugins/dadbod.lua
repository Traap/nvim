return {
  'kristijanhusak/vim-dadbod-ui',

  enabled = true,

  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion',
      ft = { 'sql', 'mysql', 'plsql' }, lazy = true
    }, -- Optional
  },

  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },

  init = function()
    -- TODO: Dynamically swap db_ui_save_location: GITHOME | WORKHOME

    local db_ui_save_location = vim.fn.getenv('WORKHOME')

    vim.g.db_ui_auto_execute_table_helpers = 1
    vim.g.db_ui_enable_query_history = 1
    vim.g.db_ui_save_location = db_ui_save_location
    vim.g.db_ui_use_nerd_fonts = 1

    vim.g.db_ui_table_helpers = {
      sqlserver = {
         Count = 'select count(*) from {table}'
        ,Top10 = 'select top 10 * from {table}'
        ,ColumnInfo = 'exec sp_columns {table}'
      }
    }
  end,
}
