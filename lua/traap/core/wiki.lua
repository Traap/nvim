local M = {}

-- Open the PDF written by :WikiExport.
-- Exports land in $WIKIHOME/printed/<page>.pdf. $PDF_VIEWER is the executable,
-- plus optional arguments. This does not use :Dispatch.
function M.page_viewer()
  local notify = require("traap.core.notify")
  local pdf_viewer = vim.env.PDF_VIEWER
  local wiki_home = vim.env.WIKIHOME

  if not pdf_viewer or pdf_viewer == "" then
    notify.error("PDF_VIEWER is not set")
    return
  end

  if not wiki_home or wiki_home == "" then
    notify.error("WIKIHOME is not set")
    return
  end

  local page_name = vim.fn.expand("%:t:r")
  local pdf = wiki_home .. "/printed/" .. page_name .. ".pdf"
  if vim.fn.filereadable(pdf) ~= 1 then
    notify.error("Wiki export not found: " .. pdf)
    return
  end

  local cmd = vim.split(pdf_viewer, "%s+", { trimempty = true })
  table.insert(cmd, pdf)
  vim.system(cmd, { detach = true })
end

return M
