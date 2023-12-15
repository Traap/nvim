-- lazy.nvim specification.

return {
  "nvim-telescope/telescope.nvim",
  enabled = true,
  cmd = "Telescope",

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  -- {{{ keymaps

  keys = function()
    local cmdT = "<cmd>Telescope "
    local cmdL = "<cmd>lua require('telescope')."
    return {
      {"<leader>fC", cmdT .. "commands<cr>"},
      {"<leader>fF", cmdT .. "media_files<cr>"},
      {"<leader>fM", cmdT .. "man_pages<cr>"},
      {"<leader>fO", cmdT .. "oldfiles<cr>"},
      {"<leader>fR", cmdT .. "registers<cr>"},
      {"<leader>fS", cmdT .. "colorscheme<cr>"},

      {"<leader>fb", cmdT .. "buffers<cr>"},
      {"<leader>fd", cmdT .. "diagnostics<cr>"},
      {"<leader>ff", cmdT .. "find_files<cr>"},
      {"<leader>fg", cmdT .. "live_grep<cr>"},
      {"<leader>fh", cmdT .. "help_tags<cr>"},

      {"<leader>fi", cmdL .. "extensions.media_files.media_files()<cr>"},
      {"<leader>fk", cmdT .. "keymaps<cr>"},
      {"<leader>fl", cmdT .. "resume<cr>"},
      {"<leader>fm", cmdT .. "marks<cr>"},
      {"<leader>fo", cmdT .. "oldfiles<cr>"},
      {"<leader>fp", cmdT .. "planets<cr>"},
      {"<leader>fw", cmdT .. "grep_string<cr>"},

      {"<leader>gC", cmdT .. "git_commits<cr>"},
      {"<leader>gb", cmdT .. "git_branches<cr>"},
      {"<leader>go", cmdT .. "git_status<cr>"},

      {"<leader>LS", cmdT .. "lsp_dynamic_workspace_symbols<cr>"},
      {"<leader>Ls", cmdT .. "lsp_document_symbols<cr>"},
    }
  end,

  -- ----------------------------------------------------------------------- }}}
  -- {{{ opts

  opts = function(_, opts)
    local actions = require("telescope.actions")
    opts.defaults = {
      layout_config = { prompt_position = "top" },
      layout_strategy = "horizontal",
      mappings = {
        i = {
          ["<c-j>"] = actions.move_selection_next,
          ["<c-k>"] = actions.move_selection_previous,
        },
      },
      prompt_prefix = " ",
      selection_caret = " ",
      sorting_strategy = "ascending",
      winblend = 0,
    }
    opts.pickers = {
      colorscheme = { enable_preview = true },
    }
    opts.extensions = {
      file_browser = {
        hijack_netrw = true,
      },
    }
  end,

  -- ----------------------------------------------------------------------- }}}
  -- {{{ config

  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
  end,
}

  -- ----------------------------------------------------------------------- }}}
