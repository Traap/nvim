-- https://github.com/tjdevries/config_manager
-- https://davelage.com/posts/nvim-dap-getting-started/

local dok, dap = pcall(require, "dap")
if not dok then
	return
end

dap.adapters.codelldb = {
	name = "codelldb",

	type = "executable",
	port = "13000",
	host = "localhost",
	executable = {
		command = "codelldb",
		args = { "--port", "${port}" },
	},
}

dap.adapters.c = dap.adapters.codelldb
dap.adapters.cpp = dap.adapters.codelldb
dap.adapters.rust = dap.adapters.codelldb

dap.configurations.c = {
	{
		name = "Launch",
		type = "codelldb",
		request = "launch",
		-- program = function()
		-- 	return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		-- end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		runInTerminal = false,
	},
}

dap.configurations.cpp = dap.configurations.cpp
dap.configurations.rust = dap.configurations.c
