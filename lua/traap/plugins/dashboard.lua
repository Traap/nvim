return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  enabled = true,

  keys = {
    {"<leader>aa", "<cmd>Dashboard<cr>", desc = "Dashboard display"}
  },

  opts = function()
    local logo = [[Configured by Traap and powered by lazy.nvim.]]
    local icons = require("traap.core.icons")

    logo = string.rep("\n", 4) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      hide = {
        -- Lualine controls status line.
        statusline = false,
      },

      config = {
        header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          {key = "f", icon = icons.ui.FindFile,  desc = " Find file",   action = "Telescope find_files" },
          {key = "n", icon = icons.ui.NewFile,   desc = " New file",    action = "ene | startinsert" },
          {key = "r", icon = icons.ui.Files,     desc = " Recent files",action = "Telescope oldfiles" },
          {key = "g", icon = icons.ui.FindText,  desc = " Find text",   action = "Telescope live_grep" },
          {key = "c", icon = icons.ui.Gear,      desc = " Config",      action = [[lua require("lazyvim.util").telescope.config_files()()]] },
          {key = "l", icon = icons.ui.Event,     desc = " Lazy",        action = "Lazy" },
          {key = "m", icon = icons.ui.Mason,     desc = " Mason",       action = "Mason" },
          {key = "q", icon = icons.ui.Quit,      desc = " Quit",        action = "qa" },
        },

        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return {icons.ui.Lazy .. "Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
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
