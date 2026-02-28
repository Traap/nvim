local platform = require("traap.core.platform")
return {
  'saghen/blink.cmp',
  enabled = true and platform.is_nvim(),

  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  opts = {
    keymap = {
      preset = 'enter',
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
      ['<tab>'] = { 'select_next', 'fallback' },
      ['<c-j>'] = { 'snippet_forward', 'fallback' },
      ['<c-k>'] = { 'snippet_backward', 'fallback' }
    },
    cmdline = { enabled = true },
    appearance = { nerd_font_variant = 'mono' },
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
      ghost_text = { enabled = true, show_with_menu = true },
      keyword = { range = 'full' },
      list = { selection = { preselect = false, auto_insert = true } },
      menu = {
        auto_show = true,
        draw = {
          columns = {
            { "label",     "label_description", gap = 1 },
            { "kind_icon", "kind" }
          },
        },
      },
    },
    sources = { default = { 'buffer', 'lsp', 'path', 'snippets' }, },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    signature = { enabled = true },
  },
  opts_extend = { "sources.default" }
}
