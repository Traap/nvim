local platform = require("traap.core.platform")
return {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = true and platform.is_nvim(),
    -- The rewrite requires Neovim 0.12, tree-sitter CLI >= 0.26, and a C
    -- compiler. It does not support lazy-loading: queries must be on the
    -- runtimepath before FileType.
    lazy = false,
    build = ":TSUpdate",

    opts = {},

    config = function(_, opts)
      local treesitter = require("nvim-treesitter")
      local notify = require("traap.core.notify")
      local required_parsers = { "bash", "regex" }

      treesitter.setup(opts)

      local function has_parser(lang)
        local ok, parser = pcall(vim.treesitter.language.add, lang)
        return ok and parser ~= nil
      end

      local function ensure_parser(lang)
        if has_parser(lang) then
          return true
        end

        notify.info("Installing Treesitter parser: " .. lang)
        local ok, err = pcall(function()
          -- Bound the wait. install() is async and wait() with no timeout blocks forever.
          treesitter.install({ lang }):wait(120000)
        end)
        if not ok then
          notify.warn(
            "Could not install Treesitter parser "
              .. lang
              .. ": "
              .. tostring(err)
          )
          return false
        end

        return has_parser(lang)
      end

      for _, parser in ipairs(required_parsers) do
        ensure_parser(parser)
      end

      local skip_fts = {
        ["blink-cmp-menu"] = true,
        help = true,
        qf = true,
        gitcommit = true,
        fugitive = true,
        lazy = true,
        mason = true,
        noice = true,
        notify = true,
        lspinfo = true,
        snacks_layout_box = true,
        snacks_notif = true,
        snacks_picker_input = true,
        snacks_picker_list = true,
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

          if not ensure_parser(lang) then
            return
          end

          if
            not vim.api.nvim_buf_is_valid(args.buf) or not has_parser(lang)
          then
            return
          end

          local ok, err = pcall(vim.treesitter.start, args.buf, lang)
          if not ok then
            notify.warn(
              "Could not start Treesitter for " .. lang .. ": " .. tostring(err)
            )
            return
          end

          vim.bo[args.buf].indentexpr =
            "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
