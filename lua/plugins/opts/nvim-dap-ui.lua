return function(_, opts)
  if Use_Defaults("nvim-dap-ui") then
    -- Use LazyVim default setup.
    opts = opts
  else
    opts.controls = {
      element = "repl",
      enabled = true,
      icons = {
        disconnect = "",
        pause = "",
        play = "",
        run_last = "",
        step_back = "",
        step_into = "",
        step_out = "",
        step_over = "",
        terminate = "",
      }
    }

    opts.element_mappings = {}

    opts.expand_lines = true

    opts.floating = {
      border = "single",
      mappings = { close = { "q", "<Esc>" } }
    }

    opts.force_buffers = true

    opts.icons = { collapsed = "", current_frame = "", expanded = "" }

    opts.layouts = {
      {
        elements = {
          { id = "scopes", size = 0.25, },
          { id = "breakpoints", size = 0.25, },
          { id = "stacks", size = 0.25, },
          { id = "watches", size = 0.25, },
        },
        position = "right",
        size = 40,
      },

      {
        elements = {
          { id = "repl", size = 0.5, },
          { id = "console", size = 0.5, },
        },
        position = "bottom",
        size = 10,
      }
    }

    opts.mappings = {
      edit = "e",
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      repl = "r",
      toggle = "t",
    }

    opts.render = {
      indent = 1,
      max_value_lines = 100,
    }
  end
end
