Constants = require("config.constants")
Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled

return {
  -- {{{ nvim-cmp
  --     TODO: Try to improve nested folds behavior.

  {
    -- {{{ Events and dependencies

    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    enabled = Is_Enabled("nvim-cmp"),

    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "f3fora/cmp-spell",
      "saadparwaiz1/cmp_luasnip",
    },

    -- --------------------------------------------------------------------- }}}
    -- {{{ opts function overfides LazyVim default behavior.

    opts = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")

    -- --------------------------------------------------------------------- }}}
      -- {{{ Formatting fileds, icons, and source_mapping

      local formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          vim_item.kind =
            string.format("%s", Constants.icons.lsp_kinds[vim_item.kind])
          vim_item.menu = (Constants.completion.source_mapping)[entry.source.name]
          return vim_item
        end,
      }

      -- ------------------------------------------------------------------- }}}
      -- {{{ Confirmaiton option

      local confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      }

      -- ------------------------------------------------------------------- }}}
      -- {{{ Add boarders to completion windows.

      local window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }

      -- ------------------------------------------------------------------- }}}
      -- {{{ Setup filetype and cmdline preferences.

      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "buffer" },
          { name = "cmp_git" },
        }),
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
          { name = "cmdline" },
        }),
      })

      -- ------------------------------------------------------------------- }}}
      -- {{{ Update the function argument opts with local choices made.

      opts.confirm_opts = confirm_opts
      opts.formatting = formatting
      opts.sources = Constants.completion.sources
      opts.window = window

      -- ------------------------------------------------------------------- }}}
    end,
  },

  -- ----------------------------------------------------------------------- }}}
}
