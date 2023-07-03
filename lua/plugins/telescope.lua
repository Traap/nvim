require("config.globals")

local plugin = "telescope.nvim"

-- {{{ Telescope keymaps

if Is_Enabled(plugin) then
  local cmdT = "<cmd>Telescope "
  local cmdL = "<cmd>lua require('telescope')."

  Keymap("n", "<leader>fC", cmdT .. "commands<cr>")
  Keymap("n", "<leader>fF", cmdT .. "media_files<cr>")
  Keymap("n", "<leader>fM", cmdT .. "man_pages<cr>")
  Keymap("n", "<leader>fO", cmdT .. "oldfiles<cr>")
  Keymap("n", "<leader>fR", cmdT .. "registers<cr>")
  Keymap("n", "<leader>fS", cmdT .. "colorscheme<cr>")

  Keymap("n", "<leader>fb", cmdT .. "buffers<cr>")
  Keymap("n", "<leader>fd", cmdT .. "diagnostics<cr>")
  Keymap("n", "<leader>ff", cmdT .. "find_files<cr>")
  Keymap("n", "<leader>fg", cmdT .. "live_grep<cr>")
  Keymap("n", "<leader>fh", cmdT .. "help_tags<cr>")

  Keymap("n", "<leader>fi", cmdL .. "extensions.media_files.media_files()<cr>")
  Keymap("n", "<leader>fk", cmdT .. "keymaps<cr>")
  Keymap("n", "<leader>fl", cmdT .. "resume<cr>")
  Keymap("n", "<leader>fm", cmdT .. "marks<cr>")
  Keymap("n", "<leader>fo", cmdT .. "oldfiles<cr>")
  Keymap("n", "<leader>fp", cmdT .. "planets<cr>")
  Keymap("n", "<leader>fw", cmdT .. "grep_string<cr>")

  Keymap("n", "<leader>gC", cmdT .. "git_commits<cr>")
  Keymap("n", "<leader>gb", cmdT .. "git_branches<cr>")
  Keymap("n", "<leader>go", cmdT .. "git_status<cr>")

  Keymap("n", "<leader>LS", cmdT .. "lsp_dynamic_workspace_symbols<cr>")
  Keymap("n", "<leader>Ls", cmdT .. "lsp_document_symbols<cr>")
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Telescope specification.

return {
  "nvim-telescope/" .. plugin,
  enabled = Is_Enabled(plugin),
  cmd = "Telescope",
  opts = function(_, opts)
    if Use_Default_Opts(plugin) then
      opts = opts
    else
      opts. defaults = {
        layout_config = { prompt_position = "top" },
        layout_strategy = "horizontal",
        prompt_prefix = " ",
        selection_caret = " ",
        sorting_strategy = "ascending",
        winblend = 0,
      }
      opts.pickers = {
        colorscheme = { enable_preview = true },
      }
    end
  end,

  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
  },
}

-- ------------------------------------------------------------------------- }}}
