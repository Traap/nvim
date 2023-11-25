-- Set em' first! Things might go sideways while I'm configuring Neovim
vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[,]]

-- Bootstrap using lazy.nvim package manager.
require("traap.core.bootstrap")

-- Personalize Neovim.
require("traap.config.options")
require("traap.config.autocmds")
require("traap.config.keymaps")
require("traap.config.lazy")

-- Set colorschme.
vim.cmd("colorscheme tokyonight-moon")

-- LSP configure.
require("traap.lsp.servers")

function Get_Selected_Text()
  local spos = vim.fn.getpos("'<")
  local epos = vim.fn.getpos("'>")
  local line = vim.fn.getline(".")
  local text = line:sub(spos[3], epos[3])
  return spos, epos, line, text
end

function Insert_Wiki_Link(spos, epos, line, text)
  local link = string.format("[%s](# %s)", text, text)
  local nline = line:sub(1, spos[3] - 1) .. link .. line:sub(epos[3] + 1)
  vim.fn.setline(".", nline)
end

function Insert_Link(text)
  local target = "# " .. text
  vim.api.nvim_buf_set_lines(0, -1, -1, false, { target } )
end

function Get_KJV_Verse(text)
  -- local cmd = "kjv -b -d " .. text
  local cmd = "kjv -b -d " .. text
  local out = vim.fn.system(cmd)
  if vim.v.shell_error == 0 then
    local lines = vim.fn.split(string.gsub(out, "[\t]", ""), "\n")
    vim.api.nvim_buf_set_lines(0, -1, -1, false, lines )
  else
    vim.notify(text .. " is not a valid verse.", vim.log.levels.WARN)
  end
end

function Insert_KVJ_Reference()
  local spos, epos, line, text = Get_Selected_Text()
  Insert_Wiki_Link(spos, epos, line, text)
  Insert_Link(text)
  Get_KJV_Verse(text)
end

-- Map a key to call the function
vim.api.nvim_set_keymap(
  'x', 'gs', [[:lua Insert_KVJ_Reference()<CR>]], { noremap = true, silent = true }
)

