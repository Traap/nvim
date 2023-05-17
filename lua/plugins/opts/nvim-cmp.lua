return function(_, opts)
  local plugin = "nvim-cmp"
  if Use_Defaults(plugin) then
    opts = opts
  else
    -- {{{ opts function begins and overrides LazyVim default behavior.

    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- --------------------------------------------------------------------- }}}
    -- {{{ Confirmaiton option

    local confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }

    -- --------------------------------------------------------------------- }}}
    -- {{{ Add boarders to completion windows.

    local window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    }

    -- --------------------------------------------------------------------- }}}
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

    -- --------------------------------------------------------------------- }}}
    -- {{{ Has words before

    local function has_words_before()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
    end

    -- --------------------------------------------------------------------- }}}
    -- {{{ Snippets

    local snippet = {
      expand = function(args) luasnip.lsp_expand(args.body) end,
    }

    -- --------------------------------------------------------------------- }}}
    -- {{{ Mappings

    local mapping = {
      ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
      ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },

      ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
      ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },

      ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
      ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },

      ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),

      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

      ["<C-e>"] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },

      ["<C-y>"] = cmp.config.disable,

      ["<CR>"] = cmp.mapping.confirm { select = false },

      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    }

    -- --------------------------------------------------------------------- }}}
    -- {{{ Update the function argument opts with local choices made.

    opts.confirm_opts = confirm_opts
    opts.mapping = mapping
    opts.snippet = snippet
    opts.sources = Constants.completion.sources
    opts.window = window

    -- ----------------------------------------------------------------------- }}}
  end
end
