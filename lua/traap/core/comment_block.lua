-- TODO: Traap's comment block pre-plugin.
-- [x] Add Traap's style comment block to visually selected block.
-- [ ] Remove Traap's style comment block from visually selected block.

local M = {}

-- Build one marker pair. The close line is 80 columns: comment leader, one
-- space, dashes, then three right braces. Braces are built with string.rep so
-- this file does not contain a fold marker of its own.
local function fold_lines(comment_start, comment_end)
  local leader = (comment_start or ""):gsub("%s+$", "")
  comment_end = comment_end or ""
  local open_mark = " " .. string.rep("{", 3) .. " "
  local close_mark = " " .. string.rep("}", 3)
  local tail = close_mark .. comment_end
  local dashes = 80 - #leader - 1 - #tail
  if dashes < 3 then
    dashes = 3
  end

  return leader .. open_mark .. comment_end, leader .. " " .. string.rep("-", dashes) .. tail
end

-- Surround selected code with comment blocks using Neovim's comment string.
function M.surround()
  local api = vim.api

  -- Get the commentstring from the current buffer
  local commentstring = vim.bo.commentstring
  local comment_start, comment_end = commentstring:match("^(.-)%%s(.-)$")

  -- If comment_end is empty (like in languages with single-line comments),
  -- default to empty string
  comment_end = comment_end or ""
  local open_line, close_line = fold_lines(comment_start, comment_end)

  -- Get the position of the start and end of the visual selection
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")

  -- Extract the line numbers from the positions
  local start_line = start_pos[2] - 1 -- Convert to 0-indexed for Lua
  local end_line = end_pos[2] -- Leave 1-indexed for buffer set

  -- Insert comment block at the top of the selection
  api.nvim_buf_set_lines(0, start_line, start_line, false, {
    open_line,
    "",
  })

  -- Insert comment block at the bottom of the selection
  api.nvim_buf_set_lines(0, end_line + 2, end_line + 2, false, {
    "",
    close_line,
  })

  -- Place cursor at the beginning of the first comment
  api.nvim_win_set_cursor(0, { start_line + 1, 4 }) -- {line_number, column_number}
end

-- Remove comment block.
function M.remove() end

return M
