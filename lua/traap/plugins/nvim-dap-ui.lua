require("traap.core.globals")

local plugin = 'nvim-dap-ui'

if Is_Enabled(plugin) then
  Keymap("n", "<leader>dU", [[<cmd>lua require("dapui").toggle()<cr>]])
end

return {
  "rcarriga/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = Constants.file_types,
  dependencies = { "mfussenegger/nvim-dap" },
  -- {{{ options

  opts = function(_, opts)
    if Use_Default_Opts(plugin) then
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
  end,

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Configuration

  config = function(_, opts)
    local dap, dapui = require("dap"), require("dapui")

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    dapui.setup(opts)
  end

  -- ----------------------------------------------------------------------- }}}
}
