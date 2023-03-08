Constants = require("config.constants")
Is_Enabled = require("config.functions").is_enabled

return {
  -- {{{ alpha-nvim

  {
    "goolord/alpha-nvim",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("alpha-nvim"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ dressing

  {
    "stevearc/dressing.nvim",
    enabled = Is_Enabled("dressing"),
    lazy = true,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Git signs and lightbulb.

  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    enabled = Is_Enabled("gitsigns.nvim"),

    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "契" },
        topdelete = { text = "契" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },

      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- stylua: ignore start
        map('n', ']h', gs.next_hunk, 'Next Hunk')
        map('n', '[h', gs.prev_hunk, 'Prev Hunk')
        map({ 'n', 'v' }, '<leader>ghs', ':Gitsigns stage_hunk<CR>', 'Stage Hunk')
        map({ 'n', 'v' }, '<leader>ghr', ':Gitsigns reset_hunk<CR>', 'Reset Hunk')
        map('n', '<leader>ghS', gs.stage_buffer, 'Stage Buffer')
        map('n', '<leader>ghu', gs.undo_stage_hunk, 'Undo Stage Hunk')
        map('n', '<leader>ghR', gs.reset_buffer, 'Reset Buffer')
        map('n', '<leader>ghp', gs.preview_hunk, 'Preview Hunk')
        map('n', '<leader>ghb', function() gs.blame_line({ full = true }) end, 'Blame Line')
        map('n', '<leader>ghd', gs.diffthis, 'Diff This')
        map('n', '<leader>ghD', function() gs.diffthis('~') end, 'Diff This ~')
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', 'GitSigns Select Hunk')
      end,
    },
  },

  {
    "kosayoda/nvim-lightbulb",
    event = "BufReadPre",
    opts = { autocmd = { enabled = true } },
    dependencies = { "antoinemadec/FixCursorHold.nvim" },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Indent guides for Neovim

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("indent-blankline"),
    opts = {
      char = "│",
      filetype_exclude = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
      },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ markdown-perview.nvim

  {
    "iamcco/markdown-preview.nvim",
    ft = "md",
    enabled = Is_Enabled("markdown-preview.nvim"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ noice.nvim - Noice - (Nice, Noise, Notice)

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    enabled = Is_Enabled("noice.nvim"),
    keys = false,

    opts = {
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },

      cmdline_popup = {
        views = {
          position = {
            row = "50%",
            col = "50%",
          },
          win_options = {
            winhighlight = "NormalFloat:NormalFloat, FloatBorder:FloatBorder",
          },
        },
      },

      lsp = {
        progress = {
          view = "notify",
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
          ["vim.lsp.util.stylize_markdown"] = false,
          ["cmp.entry.get_documentation"] = false,
        },
      },

      routes = {

        -- Youtube: Enable / disable fidget
        {
          filter = {
            event = "msg_show",
            kind = "",
          },
          opts = { skip = true },
        },

        -- Youtube: Enable / disable warn
        {
          filter = {
            event = "msg_show",
            kind = "wmsg",
          },
          opts = { skip = true },
        },
      },
    },

    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-notify

  {
    "rcarriga/nvim-notify",
    event = "BufEnter",
    enabled = Is_Enabled("nvim-notify"),
    opts = {
      background_colour = "#1a1b26",
      level = 3,
      render = "minimal",
      timeout = 1500,
      top_down = false,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-web-devicons

  {
    "nvim-tree/nvim-web-devicons",
    enabled = Is_Enabled("nvim-web-devicons"),
    cmd = {
      "NvimTreeFindFile",
      "NvimTreeRefresh",
      "NvimTreeToggle",
    },

    opts = {
      override = Constants.icons.web_devicons,
    },
  },

  -------------------------------------------------------------------------- }}}
  -- {{{ Popup.nvim

  {
    "nvim-lua/popup.nvim",
    event = "VimEnter",
    enabled = Is_Enabled("popup.nvim"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ trouble.nvim

  {
    "folke/trouble.nvim",
    event = "VimEnter",
    enabled = Is_Enabled("trouble.nvim"),
    opts = { use_diagnostic_signs = true },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ vim-most-minimal-folds

  {
    "vim-utils/vim-most-minimal-folds",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("vim-most-minimal-folds"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ virtcolumn.nvim

  {
    "xiyaowong/virtcolumn.nvim",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("virtcolumn.nvim"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Which-key

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    enabled = Is_Enabled("which-key.nvim"),
    keys = false,
  },

  -- ----------------------------------------------------------------------- }}}
}
