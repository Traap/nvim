-- {{{ Acknowledgement and source
--
-- Acknowledgement:  Folke Lemaitre
--           https://github.com/folke
--
-- Original work:
-- https://github.com/LazyVim/LazyVim/blob/a0cf00c81b3a4a352cdc26c94112d9a5827881e1/lua/lazyvim/util/init.lua-
--
-- Original work was extracted and tailored to my specific needs.
--
-- ------------------------------------------------------------------------- }}}
-- {{{ Metatable M

local M = {}

-- ------------------------------------------------------------------------- }}}
-- {{{ M.has

function M.has(plugin)
  return require("lazy.core.config").plugins[plugin] ~= nil
end

-- ------------------------------------------------------------------------- }}}
-- {{{ M.on_attach

function M.on_attach(on_attach)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, buffer)
    end,
  })
end

-- ------------------------------------------------------------------------- }}}
-- {{{ M.opts

function M.opts(name)
  local plugin = require('lazy.core.config').plugins[name]
  if not plugin then
    return {}
  end
  local Plugin = require('lazy.core.plugin')
  return Plugin.values(plugin, 'opts', false)
end

-- ------------------------------------------------------------------------- }}}
-- {{{ Return Metatable M

return M

-- ------------------------------------------------------------------------- }}}
