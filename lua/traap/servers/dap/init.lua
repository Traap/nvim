local  uok, dapui = pcall(require, 'dapui')
if not uok then return end

local  vok, vtext = pcall(require, 'nvim-dap-virtual-text')
if not vok then return end

-- See tjdevries xdg_config nvim settings.
vtext.setup {
  enabled = true,
  enabled_commands = false,
  highlight_changed_variables = true,
  highlight_new_as_changed = true,
  commented = false,
  show_stop_reason = true,
  virt_text_pos = "eol",
  all_frames = false,
}

-- See LunarVim lvim/core/dap.lua
dapui.setup {
  expand_lines = true,

  icons = {
    expanded = "",
    collapsed = "",
    circular = ""
  },

  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },

  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.33 },
        { id = "breakpoints", size = 0.17 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
      size = 0.33,
      position = "right",
    },
    {
      elements = {
        { id = "repl", size = 0.50 },
        { id = "console", size = 0.50 },
      },
      size = 0.25,
      position = "bottom",
    },
  },

  floating = {
    max_height = 0.9,
    max_width = 0.5, -- Floats will be treated as percentage of your screen.
    border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
    mappings = {
      close = { "q", "<Esc>" },
    },
  },

}

-- Future Debugger Adapter Prodocot (DAP).
require 'traap.servers.dap.languages.python'
require 'traap.servers.dap.languages.ruby'
