-- {{{ lsp-installer check

local  status_ok, signature = pcall(require, "lsp_signature")
if not status_ok then return end

-- local icons = require "user.icons"

-- ------------------------------------------------------------------------- }}}
-- {{{ define: cfg

local cfg = {
  always_trigger = false,
  auto_close_after = nil,
  bind = true,
  debug = false,
  extra_trigger_chars = {},
  fix_pos = true,
  floating_window = true,
  floating_window_above_cur_line = true,
  handler_opts = {
    border = "single",
  },
  hi_parameter = "Search",
  hint_enable = true,
  hint_prefix = " ",
  hint_scheme = "String",
  log_path = "debug_log_file_path",
  max_height = 12,
  max_width = 120,
  padding = "",
  shadow_blend = 36,
  shadow_guibg = "Black",
  timer_interval = 200,
  toggle_key = nil,
  transparency = nil,
  use_lspsaga = false,
  verbose = false,
  zindex = 200,
}

-- ------------------------------------------------------------------------- }}}
-- {{{ signature setup.

signature.setup(cfg)

-- ------------------------------------------------------------------------- }}}
