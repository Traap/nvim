-- https://github.com/tjdevries/config_manager

local ok, dap = pcall(require, "dap")
if not ok then
  return
end

dap.configurations.lua = {
  type = "nlua",
  requiest = "attach",
  name = "Attach to running Neovim instance",
}

dap.adapters.nlua = function(callback, config)
  callback({
    type = "server",
    host = config.host or "127.0.0.1",
    port = config.port or 8086,
  })
end
