-- TODO: Traap's comment block pre-plugin.
-- [x] Add Traap's style comment block to visually selected block.
-- [ ] Remove Traap's style comment block from visuall selected block.

local M = {}

-- Surround selected code with comment blocks using Neovim's comment string.
function M.surround()
  local api = vim.api

  -- Get the commentstring from the current buffer
  local commentstring = vim.bo.commentstring
  local comment_start, comment_end = commentstring:match("^(.-)%%s(.-)$")

  -- If comment_end is empty (like in languages with single-line comments),
  -- default to empty string
  comment_end = comment_end or ""

  -- Get the position of the start and end of the visual selection
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")

  -- Extract the line numbers from the positions
  local start_line = start_pos[2] - 1  -- Convert to 0-indexed for Lua
  local end_line = end_pos[2]          -- Leave 1-indexed for buffer set

  -- Insert comment block at the top of the selection
  api.nvim_buf_set_lines(0, start_line, start_line, false, {
    comment_start .. " {{{ " .. comment_end,
    ""
  })

  -- Insert comment block at the bottom of the selection
  api.nvim_buf_set_lines(0, end_line + 2, end_line + 2, false, {
    "",
    comment_start .. " --------------------------------------------------------------------- }}}" .. comment_end
  })

  -- Place cursor at the beginning of the first comment
  api.nvim_win_set_cursor(0, {start_line + 1, 4}) -- {line_number, column_number}
end

-- Remove comment block.
function M.remove()
end

return M
