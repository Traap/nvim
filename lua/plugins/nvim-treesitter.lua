require("config.traap.globals")

local plugin = "nvim-treesitter"

return {
  "nvim-treesitter/" .. plugin,
  enabled = Is_Enabled(plugin),

  opts = function(_, opts)
    if Use_Default_Opts(plugin) then
      opts = opts
    else
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
      opts.disable = { "latex" }
      opts.ensure_installed = {
        "bash", "c", "c_sharp", "cpp", "dockerfile", "html", "javascript",
        "json", "lua", "markdown", "markdown_inline", "python", "query",
        "regex", "ruby", "rust", "sql", "toml", "tsx", "typescript", "vim",
        "vimdoc", "yaml",
      }
    end
  end,

  dependencies = {
    "mrjones2014/nvim-ts-rainbow",
  },
}
