-- {{{ Credits

-- https://github.com/hackorum/nfs

-- ------------------------------------------------------------------------- }}}
-- {{{ Sumneko paths

local sumneko_root_path = "/home/traap/.local/share/nvim/lsp_servers/sumneko_lua/extension/server"
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

-- ------------------------------------------------------------------------- }}}
-- {{{ Lsp capabilities.

vim.lsp.set_log_level("debug")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilaities.textDocument.completion.completionItem.snippetSupport = true

-- ------------------------------------------------------------------------- }}}
-- {{{ Source mapping.

local cmp = require("cmp")
local source_mapping = {
  buffer = "[Buffer]",
  nvim_lsp = "[LSP]",
  nvim_lua = "[Lua]",
  cmp_tabnine = "[TN]",
  path = "[Path]",
}



-- ------------------------------------------------------------------------- }}}
-- {{{ lspkind

local lspkind = require("lspkind")
require('lspkind').init({
  with_text = true,
})

-- ------------------------------------------------------------------------- }}}
-- {{{ Setup cmp

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  mapping = {
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
  },

  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      local menu = source_mapping[entry.source.name]
      if entry.source.name == 'cmp_tabnine' then
        if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
          menu = entry.completion_item.data.detail .. ' ' .. menu
        end
        vim_item.kind = ''
      end
      vim_item.menu = menu
      return vim_item
    end
  },

  sources = {
    { name = "cmp_tabnine" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
  },
})

-- ------------------------------------------------------------------------- }}}
-- {{{ tabnine

local tabnine = require('cmp_tabnine.config')
tabnine:setup({
  max_lines = 1000,
  max_num_results = 20,
  sort = true,
  run_on_every_keystroke = true,
  snippet_placeholder = '..',
})

-- ------------------------------------------------------------------------- }}}
-- {{{ cmp_nvim_lsp

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
-- {{{ Server setups

require("lspconfig").tsserver.setup(config())
require("lspconfig").ccls.setup(config())
require("lspconfig").jedi_language_server.setup(config())
require("lspconfig").svelte.setup(config())
require("lspconfig").solang.setup(config())
require("lspconfig").cssls.setup(config())
require("lspconfig").rust_analyzer.setup(config({}))

require("lspconfig").gopls.setup(config({
  cmd = { "gopls", "serve" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}))

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
-- {{{ Snippets

local snippets_paths = function()
  local plugins = { "friendly-snippets" }
  local paths = {}
  local path
  local root_path = vim.env.HOME .. "/.vim/plugged/"
  for _, plug in ipairs(plugins) do
    path = root_path .. plug
    if vim.fn.isdirectory(path) ~= 0 then
      table.insert(paths, path)
    end
  end
  return paths
end

require("luasnip.loaders.from_vscode").lazy_load({
  paths = snippets_paths(),
  include = nil, -- Load all languages
  exclude = {},
})

-- ------------------------------------------------------------------------- }}}
