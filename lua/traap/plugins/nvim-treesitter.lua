return {
  "nvim-treesitter/nvim-treesitter",
  enabled = true,
  -- event = {"BufReadPost", "BufNewFile"},
  event = "VeryLazy",
  build = ":TSUpdate",

  opts = function(_, opts)
    opts.autopairs = { enable = true }
    opts.autotag = { enable = true, disable = { "xml" } }
    opts.context_commenting = { enable = true, enable_autocmd = false }

    opts.highlight = {
      enable = true,
      disabled = {
        "css", "latex", "markdown",
      },
      additional_vim_regex_highlighting = true,
    }

    opts.indent = { enable = true, disable = { "yml", "yaml" } }
    opts.rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = 1500,
      colors = {
        "Gold", "Orchid", "DodgerBlue", "Cornsilk", "Salmon", "LawnGreen",
      },
    }

    opts.auto_install = false
    opts.sync_install = false
    opts.ignore_install  = { "latex" }
    opts.ensure_installed = {
      "bash", "c", "c_sharp", "cpp", "dockerfile", "go", "html", "javascript",
      "json", "lua", "markdown", "markdown_inline", "python", "query", "regex",
      "ruby", "sql", "toml", "tsx", "typescript", "vim", "vimdoc", "yaml",
    }
  end,

  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
