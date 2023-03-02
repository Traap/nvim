-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#Ruby

local dok, dap = pcall(require, "dap")
if not dok then
	return
end

dap.adapters.ruby = {
	type = "executable",
	command = "bundle",
	args = { "exec", "readapt", "stdio" },
}

dap.configurations.ruby = {
	{
		type = "ruby",
		request = "launch",
		name = "Ruby",
		program = "bundle",
		programArgs = { "exec", "ruby", "${file}" },
		useBundler = true,
	},
	{
		type = "ruby",
		request = "launch",
		name = "Rails",
		program = "bundle",
		programArgs = { "exec", "rails", "s" },
		useBundler = true,
	},
	{
		type = "ruby",
		request = "launch",
		name = "Rspec",
		program = "bundle",
		programArgs = { "exec", "rspec", "${file}" },
		useBundler = true,
	},
}
