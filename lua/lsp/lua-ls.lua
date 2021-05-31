-- lua lsp settings
-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)

local home  = vim.fn.expand("$HOME")
local lspconf = require("lspconfig")
local sumneko_root_path = home .. "/.config/lua-language-server"
local sumneko_binary = home .. "/.config/lua-language-server/bin/Linux/lua-language-server"

lspconf.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    root_dir = function() return vim.loop.cwd() end,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";")
            },
            diagnostics = {
                globals = {"vim"}
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                }
            },
            telemetry = {
                enable = false
            }
        }
    }
}
