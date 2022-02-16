-- {{{ User Configuration items that are reusable through NeoVim.

local User = {}

User = {

-- ------------------------------------------------------------------------- }}}
-- {{{ language server names.

  language_servers = {
    'bashls',
    'cssls',
    'diagnosticls',
    'html',
    'jsonls',
    'emmet_ls',
    'pyright',
    'rust',
    'texlab',
    'tsserver',
    'solargraph',
    'yamlls',
    'sumneko_lua',
  },

-- ----------------------------------------------------------------------- }}}
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

-- ----------------------------------------------------------------------- }}}
-- {{{ Diagnostics Signs.

diagnostic_signs = {
 Error = " ",
 Warn = " ",
 Hint = " ",
 Info = " "
},

-- ----------------------------------------------------------------------- }}}
-- {{{ Display boarders

display_border = {border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'}},

-- ----------------------------------------------------------------------- }}}
-- {{{ Next user config items template



-- ----------------------------------------------------------------------- }}}
-- {{{ Return User table.
}

return User

-- ------------------------------------------------------------------------- }}}
