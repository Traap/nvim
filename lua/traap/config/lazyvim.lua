-- NOTE:  LazyVim defaults.

local icons = require("traap.core.icons")

return {
  "LazyVim/LazyVim",
  import = "Lazyvim.plugins",

  opts = function(_, opts)
    opts.colorscheme = function()
      require("tokyonight").load()
    end
    opts.defaults = {
      autocmds = true,
      keymaps = false,
    }
    opts.news = {
      lazyvim = true,
      neovim = false,
    }
    opts.icons.misc = { dots = icons.misc.Dots }
    opts.icons.dap = {
      Stopped             = { icons.dap.Stopped, "DiagnosticWarn", "DapStoppedLine" },
      Breakpoint          =   icons.dap.Breakpoint,
      BreakpointCondition =   icons.dap.BreakpointCondition,
      BreakpointRejected  = { icons.dap.BreakpointRejected, "DiagnosticError" },
      LogPoint            =   icons.dap.LogPoint,
    }
    opts.icons.diagnostics = {
      Error = icons.diagnostics.Error,
      Warn  = icons.diagnostics.Warn,
      Hint  = icons.diagnostics.Hint,
      Info  = icons.diagnostics.Info,
    }
    opts.icons.git = {
      added    = icons.git.LineAdded,
      modified = icons.git.LineModified,
      removed  = icons.git.LineRemoved,
    }
    opts.icons.kinds = {
      Array         = icons.kind.Array,
      Boolean       = icons.kind.Boolean,
      Class         = icons.kind.Class,
      Codeium       = icons.kind.Codium,
      Color         = icons.kind.Color,
      Control       = icons.kind.Control,
      Collapsed     = icons.kind.Collapsed,
      Constant      = icons.kind.Constant,
      Constructor   = icons.kind.Constructor,
      Copilot       = icons.kind.Copilot,
      Enum          = icons.kind.Enum,
      EnumMember    = icons.kind.EnumMember,
      Event         = icons.kind.Event,
      Field         = icons.kind.Field,
      File          = icons.kind.File,
      Folder        = icons.kind.Folder,
      Function      = icons.kind.Function,
      Interface     = icons.kind.Interface,
      Key           = icons.kind.Key,
      Keyword       = icons.kind.Keyword,
      Method        = icons.kind.Method,
      Module        = icons.kind.Module,
      Namespace     = icons.kind.Namespace,
      Null          = icons.kind.Null,
      Number        = icons.kind.Number,
      Object        = icons.kind.Object,
      Operator      = icons.kind.Operator,
      Package       = icons.kind.Package,
      Property      = icons.kind.Property,
      Reference     = icons.kind.Reference,
      Snippet       = icons.kind.Snippet,
      String        = icons.kind.String,
      Struct        = icons.kind.Struct,
      TabNine       = icons.kind.TabNine,
      Text          = icons.kind.Text,
      TypeParameter = icons.kind.TypeParameter,
      Unit          = icons.kind.Unit,
      Value         = icons.kind.Value,
      Variable      = icons.kind.Variable,
    }
    opts.kind_filter.default = {
      "Class",
      "Constructor",
      "Enum",
      "Field",
      "Function",
      "Interface",
      "Method",
      "Module",
      "Namespace",
      "Package",
      "Property",
      "Struct",
      "Trait",
    }
    opts.kind_filter.markdown = false
    opts.kind_filter.help = false
    opts.kind_filter.lua = {
      "Class",
      "Constructor",
      "Enum",
      "Field",
      "Function",
      "Interface",
      "Method",
      "Module",
      "Namespace",
      "Property",
      "Struct",
      "Trait",
    }
  end,
}
