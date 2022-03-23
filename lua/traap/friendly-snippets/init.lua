-- {{{ Credits

-- TJ DeVries
-- https://github.com/tjdevries/config_manager/tree/master/xdg_config/nvim

-- ------------------------------------------------------------------------- }}}}
-- {{{ Use protected call so we don't error on first use.

local  luasnip_ok, ls = pcall(require, 'luasnip')
if not luasnip_ok then return end

-- ------------------------------------------------------------------------- }}}}
-- {{{ LuaSnip alias

local c      = ls.choice_node
local d      = ls.dynamic_node
local events = require "luasnip.util.events"
local f      = ls.function_node
local i      = ls.insert_node
local l      = require("luasnip.extras").lambda
local s      = ls.s
local sfn    = ls.sn
local t      = ls.text_node
local types = require "luasnip.util.types"

-- ------------------------------------------------------------------------- }}}}
-- {{{ Set configuration

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "<-", "Error" } },
      },
    },
  },
}

-- ------------------------------------------------------------------------- }}}
-- {{{ function: same

local same = function(index)
  return f(function(arg)
    print(vim.inspect(arg))
    return arg[1]
  end, { index })
end

-- ------------------------------------------------------------------------- }}}
-- {{{ function: shortcut

local shortcut = function(val)
  if type(val) == "string" then
    return { t { val }, i(0) }
  end

  if type(val) == "table" then
    for k, v in ipairs(val) do
      if type(v) == "string" then
        val[k] = t { v }
      end
    end
  end

  return val
end

-- ------------------------------------------------------------------------- }}}
-- {{{ function: make

local make = function(tbl)
  local result = {}
  for k, v in pairs(tbl) do
    table.insert(result, (snippet({ trig = k, desc = v.desc }, shortcut(v))))
  end

  return result
end


-- ------------------------------------------------------------------------- }}}
-- {{{ Load vscode and ruby

require('luasnip.loaders.from_vscode').load{}

ls.filetype_extend("ruby", {"rails"})


-- ------------------------------------------------------------------------- }}}
-- {{{ Snippets

ls.snippets = {
  lua = {
    -- Comment block.
    ls.parser.parse_snippet(
      "cc1",
      "-- {{{ $1\n\n$2\n\n-- ------------------------------------------------------------------------- }}}\n"
    ),

    -- Comment block again.
    s("cc2",{
      t({"-- {{{ "}), i(1),
      t({"1"}),
      t({"2"}), i(2),
      t({"3"}),
      t({"4", "-- ------------------------------------------------------------------------- }}}", }), i(0)
    }),

  },

  all = {
    -- 03/16/22 - 23:44
    s(
      "date",
      f(function()
        return os.date "%D - %H:%M"
      end)
    ),

  },
}

-- ------------------------------------------------------------------------- }}}

