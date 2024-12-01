-- lazy.nvim specification.

return {
  "nvim-telescope/telescope.nvim",
  enabled = true,
  cmd = {"Telescope"},

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  -- {{{ keymaps

  keys = function()
    local cmdT = "<cmd>Telescope "
    local cmdL = "<cmd>lua require('telescope')."
    return {
      {"<leader>fC", cmdT .. "commands<cr>", desc = "Telescope commands" },
      {"<leader>fF", cmdT .. "media_files<cr>", desc = "Telescope media files" },
      {"<leader>fM", cmdT .. "man_pages<cr>", desc = "Telescope man pages" },
      {"<leader>fR", cmdT .. "registers<cr>", desc = "Telescope registers" },
      {"<leader>fS", cmdT .. "colorscheme<cr>", desc = "Telescope colorschemes" },

      {"<leader>fb", cmdT .. "buffers<cr>", desc = "Telescope buffers" },
      {"<leader>fd", cmdT .. "diagnostics<cr>", desc = "Telescope diagnostics" },
      {"<leader>ff", cmdT .. "find_files<cr>", desc = "Telescope Find files" },
      {"<leader>fg", cmdT .. "live_grep<cr>", desc = "Telescope Live Grep" },
      {"<leader>fh", cmdT .. "help_tags<cr>", desc = "Telecope Help files" },

      {"<leader>fi", cmdL .. "extensions.media_files.media_files()<cr>", desc = "Telescope Media files" },
      {"<leader>fk", cmdT .. "keymaps<cr>", desc = "Telescope keymaps" },
      {"<leader>fl", cmdT .. "resume<cr>", desc = "Telescope resume" },
      {"<leader>fm", cmdT .. "marks<cr>", desc = "Telescope marks" },
      {"<leader>fo", cmdT .. "oldfiles<cr>", desc = "Telescope old files" },
      {"<leader>fp", cmdT .. "planets<cr>", desc = "Telescope Planets" },
      {"<leader>fw", cmdT .. "grep_string<cr>", desc = "Telescope Find Word" },

      {"<leader>gC", cmdT .. "git_commits<cr>", desc = "Telescope git commits" },
      {"<leader>gb", cmdT .. "git_branches<cr>", desc = "Telescope git branches" },
      {"<leader>go", cmdT .. "git_status<cr>", desc = "Telescope git status" },

      {"<leader>LS", cmdT .. "lsp_dynamic_workspace_symbols<cr>", desc = "Telescope Workspace Symbols" },
      {"<leader>Ls", cmdT .. "lsp_document_symbols<cr>", desc = "Telescope Document Symbols" },
    }
  end,

  -- ----------------------------------------------------------------------- }}}
  -- {{{ opts

  opts = function(_, opts)
    local actions = require("telescope.actions")
    opts.defaults = {
      layout_config = {
        prompt_position = "top",
        height = 0.7,
        width = 0.87,
      },
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
