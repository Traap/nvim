return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  priority = 999,
  opts = function(_, opts)
    local function show_macro_recording()
      local recording_register = vim.fn.reg_recording()
      if recording_register == "" then
        return ""
      else
        return "Recording @" .. recording_register
      end
    end

    -- Recording started.
    vim.api.nvim_create_autocmd("RecordingEnter", {
      callback = function()
        require("lualine").refresh({
          place = {"statusline"},
        })
      end,
    })

    -- Recording completed.
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
        statusline = {
          "alpha",
          "checkhealth",
          "dashboard",
          "fzf",
          "lazy",
          "mason",
          "TelescopePrompt",
        },
        tabline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    }

    -- Remove statuline for specific filetypes on statup and navigation.
    vim.api.nvim_create_autocmd({"FileType", "BufEnter"}, {
      pattern = opts.options.disabled_filetypes.statusline,
      callback = function()
        vim.opt_local.laststatus = 0
      end,
    })

    -- Restore statusline for non-disabled filetypes
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        if not vim.tbl_contains(opts.options.disabled_filetypes.statusline, vim.bo.filetype) then
          vim.opt.laststatus = 2
        end
      end,
    })

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

    opts.inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    }
    opts.tabline = {}
    opts.winbar = {}
    opts.inactive_winbar = {}
    opts.extensions = { "neo-tree", "lazy" }
  end,
}
