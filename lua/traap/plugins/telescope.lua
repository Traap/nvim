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
    return {
      {"<leader>fC", cmdT .. "commands<cr>", desc = "List commands" },
      {"<leader>fF", cmdT .. "media_files<cr>", desc = "Find media files" },
      {"<leader>fM", cmdT .. "man_pages<cr>", desc = "Find man pages" },
      {"<leader>fR", cmdT .. "registers<cr>", desc = "List registers" },
      {"<leader>fS", cmdT .. "colorscheme<cr>", desc = "List colorschemes" },

      {"<leader>fb", cmdT .. "buffers<cr>", desc = "List buffers" },

      {"<leader>fc",
       function()
         require("telescope.builtin").find_files{
           cwd = vim.fn.stdpath("config")
         }
       end,
       desc = "Neovim config files"
      },

      {"<leader>fd", cmdT .. "diagnostics<cr>", desc = "Buffer diagnostics" },
      {"<leader>ff", cmdT .. "find_files<cr>", desc = "Find Find files" },
      {"<leader>fg", cmdT .. "live_grep<cr>", desc = "Live Grep" },
      {"<leader>fh", cmdT .. "help_tags<cr>", desc = "List Help files" },

      {"<leader>fk", cmdT .. "keymaps<cr>", desc = "List keymaps" },
      {"<leader>fl", cmdT .. "resume<cr>", desc = "Telescope resume" },
      {"<leader>fm", cmdT .. "marks<cr>", desc = "List marks" },
      {"<leader>fo", cmdT .. "oldfiles<cr>", desc = "List old files" },

      {"<leader>fp",
       function()
         require("telescope.builtin").find_files{
           cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
         }
       end,
       desc = "Neovim plugin packages"
      },

      {"<leader>fw", cmdT .. "grep_string<cr>", desc = "Find word under cursor" },

      {"<leader>gC", cmdT .. "git_commits<cr>", desc = "List git commits" },
      {"<leader>gb", cmdT .. "git_branches<cr>", desc = "List git branches" },
      {"<leader>go", cmdT .. "git_status<cr>", desc = "List git status" },

      {"<leader>LS", cmdT .. "lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
      {"<leader>Ls", cmdT .. "lsp_document_symbols<cr>", desc = "Document Symbols" },
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
