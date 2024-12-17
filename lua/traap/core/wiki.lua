local M = {}

-- Use PDF_VIEWER to view pdf document of prior WikiExport.  WikiExports are
-- done to WIKIHOME/printed.
--
-- TODO: Notify user when PDF_VIEWER does not exits.
-- TODO: Notify user when WIKIHOME does not exits.
-- TODO: Notify user when WikiExport document does not exist.
function M.page_viewer()
  local pdf_viewer = os.getenv("PDF_VIEWER")
  local wiki_home = os.getenv("WIKIHOME")
  local page_name = vim.fn.fnameescape(vim.fn.expand('%:p:t:r'))

  local cmd_string = pdf_viewer.." "..wiki_home.."/printed/"..page_name..".pdf"

  local command = {
    cmd = 'Dispatch',
    bang = true,
    args = { cmd_string }
  }

  vim.api.nvim_cmd(command, {})

end

return M
