-- https://github.com/tjdevries/config_manager

local dok, dap = pcall(require, "dap")
if not dok then
	return
end

-- {{{ dap.adapters.c

dap.adapters.c = {
	name = "lldb",

	type = "executable",
	attach = {
		pidProperty = "pid",
		pidSelect = "ask",
	},
	command = "lldb-vscode-11",
	env = {
		LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES",
	},
}

-- ------------------------------------------------------------------------- }}}
-- {{{ dap.configurations.c

dap.configurations.c = {
	{
		name = "Launch binary nvim",
		type = "c",
		request = "launch",
		program = "./build/bin/nvim",
		args = {
			"--headless",
			"-c",
			'echo getcompletion("vim.api.nvim_buf_", "lua")',
			"-c",
			"qa!",
		},
		cwd = nil,
		environment = nil,
		externalConsole = true,
		MIMode = "lldb",
	},

	{
		name = "Deprecated",
		type = "c",
		request = "attach",
		program = "./build/bin/nvim",
		cwd = vim.fn.expand("~/build/neovim/"),
		-- environment = nil,
		externalConsole = false,
		MIMode = "gdb",
	},

	{
		name = "Attach to Neovim",
		type = "c",
		request = "attach",
		program = vim.fn.expand("~/build/neovim/build/bin/nvim"),
		cwd = vim.fn.getcwd(),
		externalConsole = true,
		MIMode = "gdb",
	},

	{
		-- If you get an "Operation not permitted" error using this, try disabling YAMA:
		--  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
		--
		-- Careful, don't try to attach to the neovim instance that runs *this*
		name = "Fancy attach",
		type = "c",
		request = "attach",
		pid = function()
			local output = vim.fn.system({ "ps", "a" })
			local lines = vim.split(output, "\n")
			local procs = {}
			for _, line in pairs(lines) do
				-- output format
				--    " 107021 pts/4    Ss     0:00 /bin/zsh <args>"
				local parts = vim.fn.split(vim.fn.trim(line), " \\+")
				local pid = parts[1]
				local name = table.concat({ unpack(parts, 5) }, " ")
				if pid and pid ~= "PID" then
					pid = tonumber(pid)
					if pid ~= vim.fn.getpid() then
						table.insert(procs, { pid = pid, name = name })
					end
				end
			end
			local choices = { "Select process" }
			for i, proc in ipairs(procs) do
				table.insert(choices, string.format("%d: pid=%d name=%s", i, proc.pid, proc.name))
			end
			-- Would be cool to have a fancier selection, but needs to be sync :/
			-- Should nvim-dap handle coroutine results?
			local choice = vim.fn.inputlist(choices)
			if choice < 1 or choice > #procs then
				return nil
			end
			return procs[choice].pid
		end,
		args = {},
	},

	-- {
	--   name = "Run functional tests",
	--   type = 'c',
	--   request = 'attach',
	--   program = 'make',
	--   args = { 'functionaltest', },
	--   cwd = nil,
	--   environment = {
	--     TEST_FILE = "./test/functional/autocmd/fast/",
	--   },
	--   externalConsole = true,
	--   MIMode = 'lldb',
	-- },
	--[[
  {
    "type": "gdb",
    "request": "attach",
    "name": "Attach to gdbserver",
    "executable": "<path to the elf/exe file relativ to workspace root in order to load the symbols>",
    "target": "X.X.X.X:9999",
    "remote": true,
    "cwd": "${workspaceRoot}",
    "gdbpath": "path/to/your/gdb",
    "autorun": [
            "any gdb commands to initiate your environment, if it is needed"
        ]
}
  --]]
	{
		type = "c",
		request = "attach",
		program = "./build/bin/nvim",
		name = "Attach to gdbserver::Neovim",
		target = "localhost:7777",
		remote = true,
		cwd = vim.fn.expand("~/build/neovim"),
		gdbpath = vim.fn.exepath("gdb"),
	},

	-- {
	--   name = "Launch rust-analyzer lsif",
	--   type = "lldb",
	--   request = "launch",
	--   program = "/home/tjdevries/sourcegraph/rust-analyzer.git/monikers-1/target/debug/rust-analyzer",
	--   args = { "lsif", "/home/tjdevries/build/rmpv/" },
	--   cwd = "/home/tjdevries/sourcegraph/rust-analyzer.git/monikers-1/",
	--   stopOnEntry = false,
	--   runInTerminal = false,
	-- },
	{
		name = "Launch ./build/bin/nvim",
		type = "lldb",
		request = "launch",
		program = "/home/tjdevries/build/neovim.git/lua_autocmd/build/bin/nvim",
		args = { "--headless" },
		cwd = "/home/tjdevries/build/neovim.git/lua_autocmd/",
		stopOnEntry = false,
		runInTerminal = false,
	},
}

-- ------------------------------------------------------------------------- }}}
