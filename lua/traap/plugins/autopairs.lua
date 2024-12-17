return {
  "windwp/nvim-autopairs",
  event = require("traap.config.events").file,
  enabled = true,
  opts = {
    check_ts = true,
    disable_filetype = {"TelescopePrompt", "spectre_panel"},
    disable_in_macro = false,
    enable_afterquote = true,
    enable_check_bracket_line = false,
    enable_moveright = true,
    ignore_next_char = string.gsub([[ [%w%%%'%[%"%.]'] ]], "%s+", ""),
    map_bs = true,
    map_c_w = false,

    map_char = {
      all = "()",
      tex = "{",
    },

    fast_wrap = {
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0,
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "PmenuSel",
      highlight_grey = "LineNr",
    },

    ts_config = {
      lua = {"string", "source"},
      javascript = {"string", "tempalte_string"},
      java = false,
    },
  },
}
