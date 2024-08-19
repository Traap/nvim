local M = {}

function M.get_selected_text()
  local spos = vim.fn.getpos("'<")
  local epos = vim.fn.getpos("'>")
  local line = vim.fn.getline(".")
  local text = line:sub(spos[3], epos[3])
  return spos, epos, line, text
end

function M.insert_wiki_link(spos, epos, line, text)
  local link = string.format("[%s](### %s)", text, text)
  local nline = line:sub(1, spos[3] - 1) .. link .. line:sub(epos[3] + 1)
  vim.fn.setline(".", nline)
end

function M.insert_link(text)
  local target = "### " .. text
  vim.api.nvim_buf_set_lines(0, -1, -1, false, { target } )
end

function M.get_kjv_verse(text)
  local cmd = "kjv -b -d " .. text
  local out = vim.fn.system(cmd)
  local lines = nil
  if vim.v.shell_error == 0 then
    lines = vim.fn.split(string.gsub(out, "[\t]", ""), "\n")
  end
  return lines
end

function M.insert_verse_from_line()
  local _ = vim.api.nvim_get_current_buf()
  local lnbr = vim.fn.line('.')
  local text = vim.fn.trim(vim.fn.getline(lnbr))
  local lines = M.get_kjv_verse(text)
  vim.api.nvim_buf_set_lines(0, lnbr, lnbr, false, lines)
end

function M.insert_verse_from_visual_selection()
  local spos, epos, line, text = M.get_selected_text()
  M.insert_wiki_link(spos, epos, line, text)
  M.insert_link(text)
  local lines = M.get_kjv_verse(text)
  vim.api.nvim_buf_set_lines(0, -1, -1, false, lines)
end

return M
