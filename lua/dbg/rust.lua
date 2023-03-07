-- https://github.com/tjdevries/config_manager
-- https://davelage.com/posts/nvim-dap-getting-started/

local dok, dap = pcall(require, "dap")
if not dok then
	return
end

dap.adapters.codelldb = {
	type = "executable",
	command = "codelldb",
	name = "codelldb",
}

dap.configurations.rust = {
	{
		name = "Launch",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug", "file")
			-- return vim.fn.getcwd() .. "/target/debug/"
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		runInTerminal = false,
	},
}
