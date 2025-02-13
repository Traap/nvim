return {
  "nvimdev/dashboard-nvim",
  enabled = true,
  lazy = false,
  priority = 998,


  keys = {
    {"<leader>aa", "<cmd>Dashboard<cr>", desc = "Dashboard display"}
  },

  opts = function()
    local logo = [[Configured by Traap and powered by lazy.nvim.]]
    local icons = require("traap.config.icons")

    logo = string.rep("\n", 4) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      hide = {
        -- Lualine controls status line.
        statusline = true,
      },

      config = {
        header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          -- {key = "c", icon = icons.ui.Gear,      desc = " Config",      action = [[lua LazyVim.pick.config_files()()]] },
          -- {key = "f", icon = icons.ui.FindFile,  desc = " Find file",   action = [[lua LazyVim.pick()()]]},
          -- {key = "g", icon = icons.ui.FindText,  desc = " Find text",   action = [[lua LazyVim.pick("live_grep")()]]},
          {key = "h", icon = icons.ui.Check,     desc = " Check Health",action = "checkhealth" },
          {key = "l", icon = icons.ui.Event,     desc = "Lazy",         action = "Lazy" },
          {key = "m", icon = icons.ui.Mason,     desc = "Mason",       action = "Mason" },
          {key = "n", icon = icons.ui.NewFile,   desc = "New file",    action = "ene | startinsert" },
          {key = "q", icon = icons.ui.Quit,      desc = "Quit",        action = "qa" },
          {key = "r", icon = icons.ui.Files,     desc = "Recent files",action = "Telescope oldfiles"},
          -- {key = "x", icon = icons.ui.Event,     desc = " LazyExtras",  action = "LazyExtras" },
        },

        footer = function()
          local ui =  require("traap.config.icons").ui
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return {ui.Lazy .. "Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    return opts
  end,
}
