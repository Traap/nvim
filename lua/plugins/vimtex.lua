require("config.traap.globals")

local plugin = "vimtex"

-- {{{ keymaps

if Is_Enabled("vimtex") then
  Keymap("n", "<leader>lC", "<Plug>(vimtex-clean-full)")
  Keymap("n", "<leader>lG", "<Plug>(vimtex-status-all)")
  Keymap("n", "<leader>lI", "<Plug>(vimtex-info-full)")
  Keymap("n", "<leader>lK", "<Plug>(vimtex-stop-all)")
  Keymap("n", "<leader>lL", "<Plug>(vimtex-compile-selected)")
  Keymap("n", "<leader>lT", "<Plug>(vimtex-toc-toggle)")
  Keymap("n", "<leader>lX", "<Plug>(vimtex-reload-state)")
  Keymap("n", "<leader>la", "<Plug>(vimtex-context-menu)")
  Keymap("n", "<leader>lc", "<Plug>(vimtex-clean-full)")
  Keymap("n", "<leader>le", "<Plug>(vimtex-error)")
  Keymap("n", "<leader>lg", "<Plug>(vimtex-status)")
  Keymap("n", "<leader>li", "<Plug>(vimtex-info)")
  Keymap("n", "<leader>lk", "<Plug>(vimtex-stop)")
  Keymap("n", "<leader>ll", "<Plug>(vimtex-compile)")
  Keymap("n", "<leader>lm", "<Plug>(vimtex-impas-list)")
  Keymap("n", "<leader>lo", "<Plug>(vimtex-compile-output)")
  Keymap("n", "<leader>lq", "<Plug>(vimtex-log)")
  Keymap("n", "<leader>ls", "<Plug>(vimtex-toggle-main)")
  Keymap("n", "<leader>lt", "<Plug>(vimtex-toc_open)")
  Keymap("n", "<leader>lv", "<Plug>(vimtex-view)")
  Keymap("n", "<leader>lx", "<Plug>(vimtex-reload)")
end

-- ------------------------------------------------------------------------- }}}
-- {{{ lazy.nvim specification.

return {
  "lervag/" .. plugin,
  ft = {"tex", "texx"},
  enabled = Is_Enabled(plugin),
	dependencies = { "Traap/vim-bundle-vimtex" },
}

-- ------------------------------------------------------------------------- }}}
