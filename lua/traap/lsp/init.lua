local M = {}
-- {{{ claim_lspconfig_commands

M.claim_lspconfig_commands = function()
  vim.g.lspconfig = 1
end

-- ------------------------------------------------------------------------- }}}
-- {{{ create_lsp_info_command

M.create_lsp_info_command = function()
  vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", {
    desc = "Alias to `:checkhealth vim.lsp`",
  })
end

-- ------------------------------------------------------------------------- }}}
-- {{{ create_lsp_log_command

M.create_lsp_log_command = function()
  vim.api.nvim_create_user_command("LspLog", function()
    vim.cmd.tabnew(vim.lsp.log.get_filename())
  end, {
    desc = "Open the Nvim LSP client log",
  })
end

-- ------------------------------------------------------------------------- }}}
-- {{{ create_lsp_start_command

M.create_lsp_start_command = function()
  vim.api.nvim_create_user_command("LspStart", function(info)
    local server_names = #info.fargs > 0 and info.fargs or {}

    if #server_names == 0 then
      local servers = require("traap.lsp.servers").filetype_to_lsp_server()
      local server = servers[vim.bo.filetype]
      if server then
        server_names = { server }
      end
    end

    if #server_names > 0 then
      vim.lsp.enable(server_names)
    end
  end, {
    complete = function()
      return require("traap.lsp.servers").lsp_server_names()
    end,
    desc = "Enable and launch a language server",
    nargs = "*",
  })
end

-- ------------------------------------------------------------------------- }}}
-- {{{ create_lsp_restart_command

M.create_lsp_restart_command = function()
  vim.api.nvim_create_user_command("LspRestart", function(info)
    local server_names = #info.fargs > 0 and info.fargs or vim
        .iter(vim.lsp.get_clients())
        :map(function(client)
          return client.name
        end)
        :totable()

    for _, server in ipairs(server_names) do
      vim.lsp.enable(server, false)
      if info.bang then
        for _, client in ipairs(vim.lsp.get_clients({ name = server })) do
          client:stop(true)
        end
      end
    end

    vim.defer_fn(function()
      for _, server in ipairs(server_names) do
        vim.lsp.enable(server)
      end
    end, 500)
  end, {
    bang = true,
    complete = function()
      return require("traap.lsp.servers").lsp_server_names()
    end,
    desc = "Restart the given language server",
    nargs = "*",
  })
end

-- ------------------------------------------------------------------------- }}}
-- {{{ create_lsp_stop_command

M.create_lsp_stop_command = function()
  vim.api.nvim_create_user_command("LspStop", function(info)
    local server_names = #info.fargs > 0 and info.fargs or vim
        .iter(vim.lsp.get_clients())
        :map(function(client)
          return client.name
        end)
        :totable()

    for _, server in ipairs(server_names) do
      vim.lsp.enable(server, false)
      if info.bang then
        for _, client in ipairs(vim.lsp.get_clients({ name = server })) do
          client:stop(true)
        end
      end
    end
  end, {
    bang = true,
    complete = function()
      return require("traap.lsp.servers").lsp_server_names()
    end,
    desc = "Disable and stop the given language server",
    nargs = "*",
  })
end

-- ------------------------------------------------------------------------- }}}
return M
