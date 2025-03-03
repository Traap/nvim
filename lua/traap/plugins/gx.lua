return {
  "chrishrb/gx.nvim",
  enabled = false,
  event = require("traap.config.events").file,
  dependencies = { "nvim-lua/plenary.nvim" },

  opts = function(_, opts)

    if vim.fn.has("mac") then
      opts.open_browser_app = "open"
      opts.open_browser_args = { "--background" }

    elseif vim.fn.has("linux") then
      opts.open_browser_app = "xdg-open"
      opts.open_browser_args = { "--background" }

    elseif vim.fn.has("wsl") then
      opts.open_browser_app = "powershell.exe"
      opts.open_browser_args = { "--background" }

    else
      opts.open_browser_app = "xdg-open"
      opts.open_browser_args = { "--background" }
    end

    opts.handlers = {
      plugin = true,
      github = true,
      brewfile = false,
      package_json = true,
      search = true,
    }

    opts.lhandler_options = {
      search_engine = "google"
    }

  end,

  config = function(_, opts)
    require("gx").setup(opts)
  end,
}
