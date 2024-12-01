return {
  "nvim-lualine/lualine.nvim",
  enabled = true,
  lazy = false,
  priority = 995,

  opts = function(_, opts)
    local function show_macro_recording()
      local recording_register = vim.fn.reg_recording()
      if recording_register == "" then
        return ""
      else
        return "Recording @" .. recording_register
      end
    end

    -- Update statusline indicating a macro is being recorded.
    vim.api.nvim_create_autocmd("RecordingEnter", {
      callback = function()
        require("lualine").refresh({ place = { "statusline" } })
      end,
    })

    -- Clear status line macro recording message.s
    vim.api.nvim_create_autocmd("RecordingLeave", {
      callback = function()
        local timer = vim.loop.new_timer()
        timer:start(
          50,
          0,
          vim.schedule_wrap(function()
            require("lualine").refresh({ place = { "statusline" } })
          end)
        )
      end,
    })

    -- Customzie my options.
    opts.options = {
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = {
          "alpha",
          "checkhealth",
          "dashboard",
          "snacks_dashboard",
          "fzf",
          "lazy",
          "mason",
          "TelescopePrompt",
        },
      },
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    }

    -- Forcefully hide statusline on startup
    vim.api.nvim_create_autocmd("UIEnter", {
      once = true,
      callback = function()
        if vim.tbl_contains(opts.options.disabled_filetypes.statusline, vim.bo.filetype) then
          vim.opt.laststatus = 0
        end
      end,
    })

    -- Function to update laststatus based on filetype
    local function update_laststatus()
      if vim.tbl_contains(
        opts.options.disabled_filetypes.statusline, vim.bo.filetype
      ) then
        vim.opt.laststatus = 0
      else
        vim.opt.laststatus = 2
      end
    end

    -- Autocmd to handle statusline visibility when changing buffers/windows
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        update_laststatus()
      end,
    })

    -- Set desired sections.
    opts.sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = {
        { show_macro_recording },
        { "progress", separator = " ", padding = { left = 1, right = 0 } },
        { "location", padding = { left = 0, right = 1 } },
      },
      lualine_y = { "fileformat", "filetype" },
      lualine_z = { "encoding" },
    }

    -- Set inactive sections.
    opts.inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    }

    -- Initialize everything else.
    opts.tabline = {}
    opts.winbar = {}
    opts.inactive_winbar = {}
    opts.extensions = { "neo-tree", "lazy" }
  end,
}

