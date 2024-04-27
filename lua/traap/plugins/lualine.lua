return {
  "nvim-lualine/lualine.nvim",
 -- event = { "BufReadPost", "BufNewFile" },
  lazy = false,
  opts = function(_, opts)
    local function show_macro_recording()
      local recording_register = vim.fn.reg_recording()
      if recording_register == "" then
        return ""
      else
        return "Recording @" .. recording_register
      end
    end

    vim.api.nvim_create_autocmd("RecordingEnter", {
      callback = function()
        require("lualine").refresh({
          place = {"statusline"},
        })
      end,
    })

    vim.api.nvim_create_autocmd("RecordingLeave", {
      callback = function()
        local timer = vim.loop.new_timer()
        timer:start(
          50,
          0,
          vim.schedule_wrap(function()
            require("lualine").refresh({
              place = {"statusline"},
            })
          end)
        )
      end,
    })

    opts.options = {
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        inactive_winbar = {},
        statusline = { "alpha", "dashboard", "fzf", "lazy", "mason", "TelescopePrompt", },
        tabline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    }

    opts.sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = {
        { show_macro_recording, },
        { "progress", separator = " ", padding = { left = 1, right = 0 } },
        { "location", padding = { left = 0, right = 1 } },
      },
      lualine_y = { "fileformat", "filetype" },
      lualine_z = { "encoding" },
    }

    opts.tabline = {}
    opts.winbar = {}
    opts.inactive_winbar = {}
    opts.extensions = { "neo-tree", "lazy" }
  end,
}
