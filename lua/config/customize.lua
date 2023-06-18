local Customize = {}

-- {{{ Customize documentation.
-- Customize table is a plugin name and true or false.  Using nvim_tree as the
-- example:
--   true - plug is loaded
--  false - plugin is NOT loaded.
--
-- This is a quick way to determine when a customization is interfering with
-- your expected behavior or two plugins are impacting with each other.

-- ------------------------------------------------------------------------- }}}

Customize = {
  -- {{{ Enable or disable plugins.

  plugins = {
    ["Comment.nvim"] = { enabled = false },
    ["LuaSnip"] = { enabled = true },
    ["alpha-nvim"] = { enabled = true },
    ["bufferline.nvim"] = { enabled = false },
    ["bullets.vim"] = { enabled = true },
    ["catppuccin"] = { enabled = true },
    ["clipboard-image.nvim"] = { enabled = true },
    ["crates.nvim"] = { enabled = true },
    ["dressing"] = { enabled = true },
    ["flit.nvim"] = { enabled = false },
    ["fzf.vim"] = { enabled = true },
    ["gem-browse"] = { enabled = true },
    ["gitsigns.nvim"] = { enabled = true, defaults = false },
    ["harpoon"] = { enabled = true, defaults = false},
    ["indent-blankline"] = { enabled = true, defaults = false },
    ["leap.nvim"] = { enabled = false },
    ["markdown-preview.nvim"] = { enabled = true },
    ["mason.nvim"] = { enabled = true },
    ["mason-nvim-dap.nvim"] = { enabled = true },
    ["mini-ai"] = { enabled = false },
    ["mini-comment"] = { enabled = false },
    ["mini-indentscope"] = { enabled = false },
    ["mini-pairs"] = { enabled = false },
    ["mini-surround"] = { enabled = false },
    ["neo-tree.nvim"] = { enabled = true, defaults = false },
    ["neoconf.nvim"] = { enabled = false },
    ["neodev.nvim"] = { enabled = true },
    ["neoformat"] = { enabled = false },
    ["noice.nvim"] = { enabled = true, defaults = false },
    ["nui.nvim"] = { enabled = true },
    ["null-ls.nvim"] = { enabled = true },
    ["nvim-autopairs"] = { enabled = true },
    ["nvim-base16"] = { enabled = false },
    ["nvim-cmp"] = { enabled = true, defaults = false },
    ["nvim-colorizer.lua"] = { enabled = true },
    ["nvim-dap"] = { enabled = true },
    ["nvim-dap-go"] = { enabled = true },
    ["nvim-dap-python"] = { enabled = true },
    ["nvim-dap-ruby"] = { enabled = true },
    ["nvim-dap-ui"] = { enabled = true, defaults = false },
    ["nvim-dap-virtual-text"] = { enabled = true },
    ["nvim-lightbulb"] = { enabled = true, defaults = false },
    ["nvim-lspconfig"] = { enabled = true },
    ["nvim-navic"] = { enabled = true },
    ["nvim-notify"] = { enabled = true, defaults = false },
    ["nvim-spectre"] = { enabled = true },
    ["nvim-surround"] = { enabled = true },
    ["nvim-transparent"] = { enabled = false },
    ["nvim-tree"] = { enabled = false },
    ["nvim-treesitter"] = { enabled = true, defaults = true },
    ["nvim-ts-rainbow"] = { enabled = true },
    ["nvim-unimpaired"] = { enabled = true },
    ["nvim-web-devicons"] = { enabled = true },
    ["oil.nvim"] = { enabled = true, defaults = true },
    ["one-small-step-for-vimkind"] = { enabled = false },
    ["lualine.nvim"] = { enabled = true, defaults = false },
    ["plenary.nvim"] = { enabled = true },
    ["popup.nvim"] = { enabled = false },
    ["rainbow_csv"] = { enabled = true },
    ["rust-tools.nvim"] = { enabled = true },
    ["sxhkd-vim"] = { enabled = false },
    ["telescope.nvim"] = { enabled = true },
    ["telescope-dap.nvim"] = { enabled = true },
    ["telescope-fzf-native.nvim"] = { enabled = true },
    ["todo-comments.nvim"] = { enabled = true },
    ["toggleterm.nvim"] = { enabled = true },
    ["tokyonight.nvim"] = { enabled = true, defaults = false },
    ["trouble.nvim"] = { enabled = true },
    ["vim-bbye"] = { enabled = true },
    ["vim-bundle-abbreviate"] = { enabled = true },
    ["vim-bundle-fzf"] = { enabled = true },
    ["vim-bundle-plantuml"] = { enabled = true },
    ["vim-bundle-tmux-runner"] = { enabled = true },
    ["vim-bundle-vimtex"] = { enabled = true },
    ["vim-bundle-wiki.vim"] = { enabled = true },
    ["vim-bundler"] = { enabled = true },
    ["vim-commentary"] = { enabled = true },
    ["vim-easy-align"] = { enabled = true },
    ["vim-endwise"] = { enabled = true },
    ["vim-eunuch"] = { enabled = true },
    ["vim-dispatch"] = { enabled = true },
    ["vim-fugitive"] = { enabled = true },
    ["vim-illuminate"] = { enabled = false },
    ["vim-most-minimal-folds"] = { enabled = true },
    ["vim-projectionist"] = { enabled = true },
    ["vim-rails"] = { enabled = true },
    ["vim-rake"] = { enabled = true },
    ["vim-rbenv"] = { enabled = true },
    ["vim-repeat"] = { enabled = true },
    ["vim-speeddating"] = { enabled = true },
    ["vim-startuptime"] = { enabled = true },
    ["vim-surround"] = { enabled = false },
    ["vim-tmux-navigator"] = { enabled = true },
    ["vim-tmux-runner"] = { enabled = true },
    ["vim-unimpaired"] = { enabled = true },
    ["vim-visual-increment"] = { enabled = true },
    ["vimtex"] = { enabled = true },
    ["virtcolumn.nvim"] = { enabled = true },
    ["which-key.nvim"] = { enabled = true },
    ["wiki.vim"] = { enabled = true },
    ["wiki-ft.vim"] = { enabled = true },
    ["zen-mode.nvim"] = { enabled = true },
  },

  -- ------------------------------------------------------------------------- }}}
  -- {{{ Debug Adapter Protocol (DAP) debuggers

  debuggers = {
    ["bash"] = { enabled = false },
    ["dart"] = { enabled = false },
    ["go"] = { enabled = true },
    ["haskell"] = { enabled = false },
    ["java"] = { enabled = false },
    ["lua"] = { enabled = true },
    ["python"] = { enabled = true },
    ["ruby"] = { enabled = true },
    ["rust"] = { enabled = false },
  },

  -- ------------------------------------------------------------------------- }}}
}
-- {{{ Toggle terminals

Customize.toggleterm = {

  float = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ direction = "float" })
    return t:toggle()
  end,

  lazygit = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ cmd = "lazygit", direction = "float" })
    return t:toggle()
  end,

  neomutt = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ cmd = "neomutt", direction = "float" })
    return t:toggle()
  end,

  ranger = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ cmd = "ranger", direction = "float" })
    return t:toggle()
  end,
}

-- ------------------------------------------------------------------------- }}}

return Customize
