local functions = require("config.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults


local plugin = "oil.nvim"

return {
  "stevearc/" .. plugin,
  lazy = false,
  enabled = Is_Enabled(plugin),

  -- {{{ Options
  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      -- TODO: Fix copy & paste errors.
      opts.columns = {"icon"}

      opts.buf_options = {
        buflisted = false,
        bufhidden = "hide"
      }

      opts.win_options = {
        wrap = false,
        signcolmn = "no",
        cursorcol = false,
        foldcolumn = 0,
        spell = false,
        list = false,
        conceallevel = 3,
        concelcursor = "n"
      }

      opts.default_file_explorer = true
      opts.restore_win_options = true
      opts.skip_confirm_for_simple_edits = false
      opts.delete_to_trash = false
      opts.trash_command = "trash-put"
      opts.prompt_save_on_select_new_entry = true

      opts.keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-s>"] = "actions.select_vsplit",
        ["<C-h>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["g."] = "actions.toggle_hidden",
      }

      opts.use_default_keymaps = true

      opts.view_options = {
        show_hidden = false,
        is_hidden_file = function(name, bufnr)
          return vim.startswith(name, ".")
        end,
        is_always_hidden = function(name, bufnr)
          return false
        end,
      }

      opts.float = {
        border = "rounded",
        max_height = 0,
        max_width = 0,
        padding = 2,
        win_options = { winblend = 0, },
      }
      opts.preview = {
        border = "rounded",
        height = nil,
        max_height = 0.9,
        max_width = 0.9,
        min_height = { 5, 0.1 },
        min_width = { 40, 0.4 },
        width = nil,
        win_options = { winblend = 0, },
      }

      opts.progress = {
        border = "rounded",
        height = nil,
        max_height = { 10, 0.9 },
        min_height = { 5, 0.1 },
        max_width = 0.9,
        min_width = { 40, 0.4 },
        minimized_border = "none",
        width = nil,
        win_options = { winblend = 0, },
      }
    end
  end,

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Configuration

  config = function(_, opts)
    require("oil").setup(opts)
  end,

  -- ----------------------------------------------------------------------- }}}
}
