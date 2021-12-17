-- {{{ User Configuration items that are reusable through NeoVim.

local User = {}

User = {

-- ------------------------------------------------------------------------- }}}
-- {{{ language server base path.

  -- ~/.local/share/nvim/lsp_servers/bash
  -- ~/.local/share/nvim/lsp_servers/ccsls
  -- ~/.local/share/nvim/lsp_servers/diagnosticls
  -- ~/.local/share/nvim/lsp_servers/emmet_ls
  -- ~/.local/share/nvim/lsp_servers/html
  -- ~/.local/share/nvim/lsp_servers/jsonls
  -- ~/.local/share/nvim/lsp_servers/latex
  -- ~/.local/share/nvim/lsp_servers/solargraph
  -- ~/.local/share/nvim/lsp_servers/sumenko_lua
  -- ~/.local/share/nvim/lsp_servers/tsserver
  -- ~/.local/share/nvim/lsp_servers/vim
  -- ~/.local/share/nvim/lsp_servers/yaml

  servers_and_programs = {
    {name = 'bashls',       dir = 'bash'},
    {name = 'cssls',        dir = 'ccsl'},
    {name = 'diagnosticls', dir = 'diagnosticsl'},
    {name = 'emmet_ls',     dir = 'emmet_ls'},
    {name = 'html',         dir = 'html'},
    {name = 'jsonls',       dir = 'jasonls'},
    {name = 'solargraph',   dir = 'solargraph'},
    {name = 'texlab',       dir = 'latex'},
    {name = 'tsserver',     dir = 'tssver' },
    {name = 'vimls',        dir = 'vim'},
    {name = 'yamlls',       dir = 'yaml'},
  },

  language_server_path = '~/.local/share/nvim',

-- ----------------------------------------------------------------------- }}}
-- {{{ language server names.

  language_servers = {
    -- 'bashls',
    'cssls',
    'diagnosticls',
    'html',
    'jsonls',
    -- 'emmet_ls',
    'texlab',
    'tsserver',
    -- 'solargraph',
    'yamlls',
  },

-- ----------------------------------------------------------------------- }}}
-- {{{ Lua language server paths.

  sumneko_root_path = "/home/traap/.local/share/nvim/lsp_servers/sumneko_lua/extension/server",
  sumneko_binary    = "/home/traap/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/Linux/lua-language-server",

  -- Fix me.
  -- sumneko_binary = User.sumneko_root_path.."/bin/Linux/lua-language-server",

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
