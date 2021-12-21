-- {{{ Credits

-- https://github.com/hackorum/nfs
-- https://github.com/ThePrimeagen/.dotfiles

-- ------------------------------------------------------------------------- }}}
-- {{{ define lspconfig and config variables.

local  lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_ok then return end

local configs = require 'lspconfig/configs'

-- ------------------------------------------------------------------------- }}}
-- {{{ Sumneko paths

local sumneko_root_path = require('traap/config').sumneko_root_path
local sumneko_binary    = require('traap/config').sumneko_binary

-- ------------------------------------------------------------------------- }}}
-- {{{ Lsp capabilities

vim.lsp.set_log_level("error")

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- ------------------------------------------------------------------------- }}}
-- {{{ Langauge Server List

local language_servers = require('traap/config').language_servers

-- ------------------------------------------------------------------------- }}}
-- {{{ function: on_attach

local on_attach = function(client, bufnr)
  print('on_attach')
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- ------------------------------------------------------------------------- }}}
-- {{{ function: config

local function config(_config)
  return vim.tbl_deep_extend("force", {
    capabilities = require("cmp_nvim_lsp").update_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    ),
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  },
  _config or {}
  )
end

-- ------------------------------------------------------------------------- }}}
-- {{{ config: emmet-ls

configs.emmet_ls = {
  default_config = {
    cmd = {'emmet-ls', '--stdio'};
    filetypes = {'html', 'css', 'blade'};
    root_dir = function(_)
      return vim.loop.cwd()
    end;
    settings = {};
  };
}

-- lspconfig.emmet_ls.setup{ capabilities = capabilities; }

-- ------------------------------------------------------------------------- }}}
-- {{{ config: sumneko_lua

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
-- lspconfig.sumneko_lua.setup(config({
--   cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
--   settings = {
--     Lua = {
--       runtime = {
--         version = "LuaJIT",
--         path = vim.split(package.path, ";"),
--       },
--       diagnostics = {
--         globals = { "vim" },
--       },
--       workspace = {
--         library = {
--           [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--           [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
--         },
--       },
--     },
--   },
-- }))

-- ------------------------------------------------------------------------- }}}
-- {{{ lsp: Iterate over language servers to enable capabilities.

-- for _, server in ipairs(language_servers) do
--   require'lspconfig'[server].setup{ capabilities = capabilities; }
-- end

-- ------------------------------------------------------------------------- }}}
-- {{{ Symbol outlines

local opts = {
  highlight_hovered_item = true,
  show_guides = true,
}

require("symbols-outline").setup(opts)

-- ------------------------------------------------------------------------- }}}
