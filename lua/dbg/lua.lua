-- https://github.com/tjdevries/config_manager

local ok, dap = pcall(require, "dap")
if not ok then
	return
end

dap.adapters.nlua = function(callback, config)
	callback({ type = "server", host = config.host, port = config.port })
end

dap.configurations.lua = {
	{
		type = "nlua",
		request = "attach",
		name = "Attach to running Neovim instance",
		host = function()
			return "127.0.0.1"
		end,
		port = function()
			local val = 54231
			return val
		end,
	},
}
