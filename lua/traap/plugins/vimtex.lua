return {
  "lervag/vimtex",
  ft = {"tex", "texx"},
  enabled = true,

  keys = {
    {"<leader>lC", "<Plug>(vimtex-clean-full)"},
    {"<leader>lG", "<Plug>(vimtex-status-all)"},
    {"<leader>lI", "<Plug>(vimtex-info-full)"},
    {"<leader>lK", "<Plug>(vimtex-stop-all)"},
    {"<leader>lL", "<Plug>(vimtex-compile-selected)"},
    {"<leader>lT", "<Plug>(vimtex-toc-toggle)"},
    {"<leader>lX", "<Plug>(vimtex-reload-state)"},
    {"<leader>la", "<Plug>(vimtex-context-menu)"},
    {"<leader>lc", "<Plug>(vimtex-clean-full)"},
    {"<leader>le", "<Plug>(vimtex-error)"},
    {"<leader>lg", "<Plug>(vimtex-status)"},
    {"<leader>li", "<Plug>(vimtex-info)"},
    {"<leader>lk", "<Plug>(vimtex-stop)"},
    {"<leader>ll", "<Plug>(vimtex-compile)"},
    {"<leader>lm", "<Plug>(vimtex-impas-list)"},
    {"<leader>lo", "<Plug>(vimtex-compile-output)"},
    {"<leader>lq", "<Plug>(vimtex-log)"},
    {"<leader>ls", "<Plug>(vimtex-toggle-main)"},
    {"<leader>lt", "<Plug>(vimtex-toc_open)"},
    {"<leader>lv", "<Plug>(vimtex-view)"},
    {"<leader>lx", "<Plug>(vimtex-reload)"},
  },
}
