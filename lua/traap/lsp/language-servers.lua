-- {{{ Credits

-- https://github.com/hackorum/nfs
-- https://github.com/ThePrimeagen/.dotfiles

-- ------------------------------------------------------------------------- }}}
-- {{{ Sumneko paths

local sumneko_root_path = "/home/traap/.local/share/nvim/lsp_servers/sumneko_lua/extension/server"
local sumneko_binary = sumneko_root_path.."/bin/Linux/lua-language-server"

-- ------------------------------------------------------------------------- }}}
-- {{{ Lsp capabilities.

vim.lsp.set_log_level("debug")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- ------------------------------------------------------------------------- }}}
-- {{{ HTML languages.
--
--     Add the languages you use, see language support

require'lspconfig/configs'.ls_emmet = {
  default_config = {
    cmd = { 'ls_emmet', '--stdio' };
    filetypes = { 'html', 'css', 'scss'};
    root_dir = function(_)
      return vim.loop.cwd()
    end;
    settings = {};
  };
}

-- ------------------------------------------------------------------------- }}}
-- {{{ Sumneko hack.
--
--     set the path to the sumneko installation; if you previously installed via
--     the now deprecated :LspInstall, use

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- ------------------------------------------------------------------------- }}}
-- {{{ Langauge Server List

local langservers = {
  'cssls',
  'diagnosticls',
  'html',
  'jsonls',
  'ls_emmet',
  'pylsp',
  'texlab',
  'tsserver',
  'yamlls'
}

-- ------------------------------------------------------------------------- }}}
-- {{{ function: cmp_nvim_lsp

local function config(_config)
  return vim.tbl_deep_extend("force", {
    capabilities = require("cmp_nvim_lsp").update_capabilities(
       vim.lsp.protocol.make_client_capabilities()
     ),
   },
   _config or {}
  )
end

-- ------------------------------------------------------------------------- }}}
-- {{{ lsp: Iterate over language servers.

for _, server in ipairs(langservers) do
  require'lspconfig'[server].setup(config())
end

-- ------------------------------------------------------------------------- }}}

require("lspconfig").sumneko_lua.setup(config({
  cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        },
      },
    },
  },
}))

-- ------------------------------------------------------------------------- }}}
-- {{{ Symbol outlines

local opts = {
  highlight_hovered_item = true,
  show_guides = true,
}

require("symbols-outline").setup(opts)

-- ------------------------------------------------------------------------- }}}
