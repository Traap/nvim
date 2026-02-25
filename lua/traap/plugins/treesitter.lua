return {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",

    opts = {
      highlight = {
        enable = true and not vim.g.vscode,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    },

    config = function(_, _)
      local notify = require("traap.core.notify")

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
          if not ft or skip_fts[ft] then return end

          local lang = vim.treesitter.language.get_lang(ft)
          if not lang then return end

          -- already available → nothing to do
          if pcall(vim.treesitter.language.add, lang) then
            return
          end

          notify.info("Installing Treesitter parser: " .. lang)
          vim.cmd("TSInstallSync " .. lang)
        end,
      })
    end,
  },
}
