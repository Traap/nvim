return {
  "lewis6991/gitsigns.nvim",
  event = require("traap.config.events").file,
  enabled = true,

  opts = function(_, opts)
    opts.signs = {
      add          = { text = "▎" },
      change       = { text = "▎" },
      changedelete = { text = "▎" },
      delete       = { text = '_' },
      topdelete    = { text = '‾' },
      untracked    = { text = "▎" },
    }

    opts.current_line_blame = true
    opts.current_line_blame_formatter = " <author>, <author_time:%Y-%m-%d> - <summary>"
    opts.trouble = false

    opts.on_attach = function(buffer)
      local gs = package.loaded.gitsigns

      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, {buffer = buffer, desc = desc})
      end

      map("n", "]h", gs.next_hunk, "Next hunk")
      map("n", "[h", gs.prev_hunk, "Prev hunk")


      map("n", "<leader>SB", function() gs.blame_line({full = true}) end, "Blame line full")
      map("n", "<leader>Sb", gs.blame_line, "Blame Line")

      map({"n", "v"}, "<leader>SR", gs.reset_hunk, "Reset hunk")

      map({"n", "v"}, "<leader>Sh", gs.stage_hunk, "Stage hunk")
      map("n", "<leader>SH", gs.undo_stage_hunk, "Undo stage hunk")

      map("n", "<leader>Sp", gs.preview_hunk, "Preview hunk")
      map("n", "<leader>Sr", gs.reset_buffer, "Reset buffer")

      map({"x", "o"}, "ih", "<cmd><C-U>Gitsigns select_hunk<cr>", "Gitsigns Select Hunk")

    end
  end,

  config = function(_, opts)
    require('gitsigns').setup(opts)
  end,
}
