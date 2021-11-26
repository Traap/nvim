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

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

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
-- {{{ Langauge Server List

local langservers = {
  'bashls',
  'cssls',
  'diagnosticls',
  'html',
  'jsonls',
  'ls_emmet',
  'pylsp',
  'texlab',
  'tsserver',
  'solargraph',
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
  require'lspconfig'[server].setup{
    capabilities = capabilities,
  }
end

-- ------------------------------------------------------------------------- }}}
-- {{{ lsp: sumneko_lu

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
