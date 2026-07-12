local platform = require("traap.core.platform")
return {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = true and platform.is_nvim(),
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",

    opts = {
      highlight = {
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    },

    config = function(_, opts)
      local treesitter = require("nvim-treesitter")
      local notify = require("traap.core.notify")
      local required_parsers = { "bash", "regex" }

      treesitter.setup(opts)

      local function has_parser(lang)
        local ok, parser = pcall(vim.treesitter.language.add, lang)
        return ok and parser ~= nil
      end

      for _, parser in ipairs(required_parsers) do
        if not has_parser(parser) then
          notify.info("Installing Treesitter parser: " .. parser)
          treesitter.install({ parser }):wait()
        end
      end

      local skip_fts = {
        help = true,
        qf = true,
        gitcommit = true,
        fugitive = true,
        lazy = true,
        mason = true,
        notify = true,
        lspinfo = true,
      }

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local ft = args.match
          if not ft or skip_fts[ft] then
            return
          end

          local lang = vim.treesitter.language.get_lang(ft)
          if not lang then
            return
          end

          -- already available → nothing to do
          if has_parser(lang) then
            return
          end

          notify.info("Installing Treesitter parser: " .. lang)
          treesitter.install({ lang }):wait()
        end,
      })
    end,
  },
}
