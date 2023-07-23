local Customize                    = {}
-- {{{ Customize documentation.
--
-- Customize table provide fine-grained control over how plugins are
-- initialized:

--  enabled:
--      true - plug is loaded
--     false - plugin is NOT loaded.
--  default:
--    opts:
--      true - default options are used.
--     false - You set the options.
--    config:
--      true - default configurations are used.
--     false - You set the configuration.
--    keys:
--      true - default plugins keys are used.
--     false - you set the keys
--
-- ------------------------------------------------------------------------- }}}

Customize                          = {
  plugins                          = {
    ["Comment.nvim"]               = { enabled = false, default = { opts = true, config = true, keys = true }},
    ["LuaSnip"]                    = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["alpha-nvim"]                 = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["bufferline.nvim"]            = { enabled = false, default = { opts = true, config = true, keys = true }},
    ["bullets.vim"]                = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["catppuccin"]                 = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["clipboard-image.nvim"]       = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["crates.nvim"]                = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["dressing.nvim"]              = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["flit.nvim"]                  = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["fzf.vim"]                    = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["gem-browse"]                 = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["gitsigns.nvim"]              = { enabled = true,  default = { opts = false, config = true, keys = false }},
    ["harpoon"]                    = { enabled = true,  default = { opts = false, config = true, keys = true }},
    ["indent-blankline"]           = { enabled = true,  default = { opts = false, config = true, keys = true }},
    ["leap.nvim"]                  = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["markdown-preview.nvim"]      = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["mason.nvim"]                 = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["mason-nvim-dap.nvim"]        = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["mini.ai"]                    = { enabled = false, default = { opts = true, config = true, keys = true }},
    ["mini.comment"]               = { enabled = false, default = { opts = true, config = true, keys = true }},
    ["mini.indentscope"]           = { enabled = false, default = { opts = true, config = true, keys = true }},
    ["mini.pairs"]                 = { enabled = false, default = { opts = true, config = true, keys = true }},
    ["mini.surround"]              = { enabled = false, default = { opts = true, config = true, keys = true }},
    ["neo-tree.nvim"]              = { enabled = true,  default = { opts = false, config = true, keys = true }},
    ["neoconf.nvim"]               = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["neodev.nvim"]                = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["neoformat"]                  = { enabled = false, default = { opts = true, config = true, keys = true }},
    ["noice.nvim"]                 = { enabled = true,  default = { opts = false, config = true, keys = true }},
    ["nui.nvim"]                   = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["null-ls.nvim"]               = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["nvim-autopairs"]             = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["nvim-base16"]                = { enabled = false, default = { opts = true, config = true, keys = true }},
    ["nvim-cmp"]                   = { enabled = true,  default = { opts = false, config = true, keys = true }},
    ["nvim-colorizer.lua"]         = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["nvim-dap"]                   = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["nvim-dap-go"]                = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["nvim-dap-python"]            = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["nvim-dap-ruby"]              = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["nvim-dap-ui"]                = { enabled = true,  default = { opts = false, config = true, keys = true }},
    ["nvim-dap-virtual-text"]      = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["nvim-lightbulb"]             = { enabled = true,  default = { opts = false, config = true, keys = true }},
    ["nvim-lspconfig"]             = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["nvim-navic"]                 = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["nvim-notify"]                = { enabled = true,  default = { opts = false, config = true, keys = true }},
    ["nvim-spectre"]               = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["nvim-surround"]              = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["nvim-transparent"]           = { enabled = true, default = { opts = true, config = true, keys = true }},
    ["nvim-tree"]                  = { enabled = false, default = { opts = true, config = true, keys = true }},
    ["nvim-treesitter"]            = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["nvim-ts-rainbow"]            = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["nvim-unimpaired"]            = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["nvim-web-devicons"]          = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["oil.nvim"]                   = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["one-small-step-for-vimkind"] = { enabled = false, default = { opts = true, config = true, keys = true }},
    ["lualine.nvim"]               = { enabled = true,  default = { opts = false, config = true, keys = true }},
    ["plenary.nvim"]               = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["popup.nvim"]                 = { enabled = false, default = { opts = true, config = true, keys = true }},
    ["rainbow_csv"]                = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["rust-tools.nvim"]            = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["sxhkd-vim"]                  = { enabled = false, default = { opts = true, config = true, keys = true }},
    ["telescope.nvim"]             = { enabled = true,  default = { opts = false, config = true, keys = false }},
    ["telescope-dap.nvim"]         = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["telescope-fzf-native.nvim"]  = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["todo-comments.nvim"]         = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["toggleterm.nvim"]            = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["tokyonight.nvim"]            = { enabled = true,  default = { opts = false, config = true, keys = true }},
    ["trouble.nvim"]               = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["vim-bbye"]                   = { enabled = false, default = { opts = true, config = true, keys = true }},
    ["vim-bundle-abbreviate"]      = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["vim-bundle-fzf"]             = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["vim-bundle-plantuml"]        = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["vim-bundle-tmux-runner"]     = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["vim-bundle-vimtex"]          = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["vim-bundle-wiki.vim"]        = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["vim-bundler"]                = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["vim-commentary"]             = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["vim-easy-align"]             = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["vim-endwise"]                = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["vim-eunuch"]                 = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["vim-dispatch"]               = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["vim-fugitive"]               = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["vim-illuminate"]             = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["vim-most-minimal-folds"]     = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["vim-projectionist"]          = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["vim-rails"]                  = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["vim-rake"]                   = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["vim-rbenv"]                  = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["vim-repeat"]                 = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["vim-speeddating"]            = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["vim-startuptime"]            = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["vim-surround"]               = { enabled = false, default = { opts = true, config = true, keys = true }},
    ["vim-tmux-navigator"]         = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["vim-tmux-runner"]            = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["vim-unimpaired"]             = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["vim-visual-increment"]       = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["vimtex"]                     = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["virtcolumn.nvim"]            = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["which-key.nvim"]             = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["wiki.vim"]                   = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["wiki-ft.vim"]                = { enabled = true,  default = { opts = true, config = true, keys = true }},
    ["zen-mode.nvim"]              = { enabled = true,  default = { opts = true, config = true, keys = true }},
  },
}

return Customize
