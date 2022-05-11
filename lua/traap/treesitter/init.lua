-- {{{ Bail when requried packages are not loaded.

local  ts_config_ok, ts_config = pcall(require, 'nvim-treesitter.configs')
if not ts_config_ok then return end

-- ------------------------------------------------------------------------- }}}
-- {{{ Treesitter config setup.

ts_config.setup {
  autopairs = {enable = true,},
  autotag = {
    enable = true,
    disable = { "xml" },
  },
  context_commenting = {
    enable = true,
    enable_autocmd = false,
  },
  ensure_installed = 'all',
  ignore_install = {''},
  sync_install = false,
  highlight = {
    enable = true,
    disable = {'css', 'markdown'},
    additional_vim_regex_highlighting=true,
  },
  indent = {enable = true, disable = {'yaml'}},
  playground = { enable = true, },
  rainbow = {
    enable = true,
    colors = {
      "Gold",
      "Orchid",
      "DodgerBlue",
      -- "Cornsilk",
      -- "Salmon",
      -- "LawnGreen",
    },
    disable = { "html" },
  },
}

-- ------------------------------------------------------------------------- }}}
