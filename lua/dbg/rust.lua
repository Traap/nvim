local dok, dap = pcall(require, "dap")
if not dok then
	return
end

dap.adapters.codelldb = {
	type = "server",
	host = "127.0.0.1",
	port = 13000, -- 💀 Use the port printed out or specified with `--port`
}

dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = "codelldb",
		args = { "--port", "${port}" },
	},
}

local M = {}

function M.setup()
	vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
		once = true,
		pattern = { "*.rs" },
		callback = function()
			local metadata = vim.fn.json_decode(
				vim.fn.system({ "cargo", "metadata", "--format-version=1", "--no-deps" })
			) or {}
			local workspace = metadata.workspace_root
			local target_dir = metadata.target_directory
			local root_pkg = metadata.packages[1]

			local dap_config = {}
			local function has(arr, val)
				for _, value in pairs(arr) do
					if value == val then
						return true
					end
				end
				return false
			end

			for _, crate in pairs(root_pkg.targets) do
				if has(crate.kind, "bin") then
					table.insert(dap_config, {
						type = "lldb",
						request = "launch",
						name = "Debug executable '" .. crate.name .. "'",
						cargo = {
							args = { "build", "--package=" .. root_pkg.name, "--bin=" .. crate.name },
							filter = { name = crate.name, kind = "bin" },
						},
						program = target_dir .. "/debug/" .. crate.name,
						args = {},
						cwd = workspace,
					})
					table.insert(dap_config, {
						type = "lldb",
						request = "launch",
						name = "Debug unit tests in executable '" .. crate.name .. "'",
						program = function()
							---@param arr string[]
							---@param reason_name string
							---@return table[]
							local function expand_reason(arr, reason_name)
								local out = {}
								for _, js_txt in pairs(arr) do
									local js = vim.fn.json_decode(js_txt) or {}
									if js.reason == reason_name then
										table.insert(out, js)
									end
								end
								return out
							end

							local output_lines = vim.fn.split(
								vim.fn.system({
									"cargo",
									"test",
									"-q",
									"--package=" .. root_pkg.name,
									"--bin=" .. crate.name,
									"--no-run",
									"--message-format=json",
								}),
								"\n"
							)
							local exe_datas = expand_reason(output_lines, "compiler-artifact") or {}
							exe_datas = vim.fn.filter(exe_datas, function(_, val)
								return val.executable ~= vim.NIL
							end)
							if #exe_datas == 1 then
								return exe_datas[1].executable
							else
								return coroutine.create(function(dap_run_co)
									vim.ui.select(exe_datas, {
										prompt = "Select executables:",
										format_item = function(exe_data)
											return exe_data.executable
										end,
									}, function(exe_data)
										coroutine.resume(dap_run_co, exe_data.executable)
									end)
								end)
							end
						end,
						args = function()
							local tests = vim.fn.split(
								vim.fn.system({
									"cargo",
									"test",
									"-q",
									"--package=" .. root_pkg.name,
									"--bin=" .. crate.name,
									"--",
									"--list",
									"--format=terse",
								}),
								"\n"
							)
							local run_all = "Run All tests"
							table.insert(tests, run_all)
							return coroutine.create(function(dap_run_co)
								vim.ui.select(tests, {
									prompt = "Select test:",
								}, function(terse)
									local test = vim.fn.split(terse)[1]
									if terse == run_all then
										coroutine.resume(dap_run_co, {})
									else
										coroutine.resume(dap_run_co, { test:sub(1, -2) })
									end
								end)
							end)
						end,
						cwd = workspace,
					})
				end
				if has(crate.kind, "lib") then
					table.insert(dap_config, {
						type = "lldb",
						request = "launch",
						name = "Debug unit tests in library '" .. crate.name .. "'",
						program = function()
							---指定したreasonの出力をtableの配列で取りだす
							---@param arr string[]
							---@param reason_name string
							---@return table[]
							local function expand_reason(arr, reason_name)
								local out = {}
								for _, js_txt in pairs(arr) do
									local js = vim.fn.json_decode(js_txt) or {}
									if js.reason == reason_name then
										table.insert(out, js)
									end
								end
								return out
							end

							local output_lines = vim.fn.split(
								vim.fn.system({
									"cargo",
									"test",
									"-q",
									"--package=" .. root_pkg.name,
									"--lib",
									"--no-run",
									"--message-format=json",
								}),
								"\n"
							)
							local exe_datas = expand_reason(output_lines, "compiler-artifact") or {}
							exe_datas = vim.fn.filter(exe_datas, function(_, val)
								return val.executable ~= vim.NIL
							end)
							if #exe_datas == 1 then
								return exe_datas[1].executable
							else
								return coroutine.create(function(dap_run_co)
									vim.ui.select(exe_datas, {
										prompt = "Select executables:",
										format_item = function(exe_data)
											return exe_data.executable
										end,
									}, function(exe_data)
										coroutine.resume(dap_run_co, exe_data.executable)
									end)
								end)
							end
						end,
						args = function()
							local tests = vim.fn.split(
								vim.fn.system({
									"cargo",
									"test",
									"-q",
									"--package=" .. root_pkg.name,
									"--lib",
									"--",
									"--list",
									"--format=terse",
								}),
								"\n"
							)
							local run_all = "Run All tests"
							table.insert(tests, run_all)
							return coroutine.create(function(dap_run_co)
								vim.ui.select(tests, {
									prompt = "Select test:",
								}, function(terse)
									local test = vim.fn.split(terse)[1]
									if terse == run_all then
										coroutine.resume(dap_run_co, {})
									else
										coroutine.resume(dap_run_co, { test:sub(1, -2) })
									end
								end)
							end)
						end,
						cwd = workspace,
					})
				end
			end
			require("dap").configurations.rust = dap_config
		end,
	})
end

return M
