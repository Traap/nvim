return {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,

    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })

      local parsers = {
        "bash", "c", "c_sharp", "cpp", "css", "dockerfile", "go", "html",
        "javascript", "json", "jsonc", "julia", "latex", "lua", "markdown",
        "markdown_inline", "python", "query", "regex", "ruby", "scss", "sql",
        "svelte", "toml", "tsx", "typescript", "typst", "vim", "vimdoc", "vue",
        "xml", "yaml", "zig"
      }

      for _, parser in ipairs(parsers) do
        vim.api.nvim_create_autocmd("FileType", {
          pattern = parser,
          callback = function()
            if not require("nvim-treesitter.parsers").has_parser(parser) then
              require("nvim-treesitter.install").ensure_installed(parser)
            end
          end,
        })
      end
    end,
  },
}

