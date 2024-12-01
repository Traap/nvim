return {
  "dstein64/vim-startuptime",
  enabled = true,
  cmd = "StartupTime",
  config = function()
    vim.g.startuptime_tries = 10
  end,
}
