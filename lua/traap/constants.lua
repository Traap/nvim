-- {{{ Constants Configuration items that are reusable through NeoVim.

local Constants = {}

Constants = {

-- ------------------------------------------------------------------------- }}}
-- {{{ language server names.

use_lsp = true,
language_servers = {
  'bashls',
  'cssls',
  'diagnosticls',
  'html',
  'jsonls',
  'emmet_ls',
  'pyright',
  -- 'rust',
  'texlab',
  -- 'tsserver',
  'solargraph',
  'yamlls',
  'sumneko_lua',
},

-- ------------------------------------------------------------------------- }}}
-- {{{ Lsp kind icons.

lsp_kind_icons = {
  Class         = "",
  Color         = "",
  Constant      = "",
  Constructor   = "",
  Enum          = "",
  EnumMember    = "",
  Event         = "",
  Field         = "",
  File          = "",
  Folder        = "",
  Function      = "",
  Interface     = "",
  Keyword       = "",
  Method        = "",
  Module        = "",
  Operator      = "",
  Property      = "",
  Reference     = "",
  Snippet       = " ",
  Struct        = "",
  Text          = "",
  TypeParameter = "",
  Unit          = "",
  Value         = "",
  Variable      = "",
  buffer        = "﬘ ",
  calc          = " ",
  nvim_lsp      = " ",
  path          = " ",
  spell         = " ",
  vsnip         = " ",
},

-- ------------------------------------------------------------------------- }}}
-- {{{ Diagnostics Signs.

  diagnostic_signs = {
    {name = 'DiagnosticSignError', text = ''},
    {name = 'DiagnosticSignHint',  text = ''},
    {name = 'DiagnosticSignInfo',  text = ''},
    {name = 'DiagnosticSignWarn',  text = ''},
  },

-- ------------------------------------------------------------------------- }}}
-- {{{ Display boarders

display_border = {border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'}},

-- ------------------------------------------------------------------------- }}}
-- {{{ keybinding options

normal_opts = {
  mode    = "n",        -- NORMAL mode
  prefix  = "<leader>", -- Override this value.
  buffer  = nil,        -- Global mappings. Specify a buffer number for buffer
                        --   local mappings
  silent  = true,       -- use `silent` when creating keymaps
  noremap = true,       -- use `noremap` when creating keymaps
  nowait  = true,       -- use `nowait` when creating keymaps
},

visual_opts = {
  mode    = "v",        -- VISUAL mode
  prefix  = "<leader>", -- Override this value.
  buffer  = nil,        -- Global mappings. Specify a buffer number for buffer
                        --   local mappings
  silent  = true,       -- use `silent` when creating keymaps
  noremap = true,       -- use `noremap` when creating keymaps
  nowait  = true,       -- use `nowait` when creating keymaps
},

-- ------------------------------------------------------------------------- }}}
-- {{{ Return Constants table.
}

return Constants

-- ------------------------------------------------------------------------- }}}
