-- vimtex
--
-- https://github.com/lervag/vimtex

local g = vim.g

g.vimtex_fold_enabled = 0
g.vimtex_fold_manual = 1
g.vimtex_format_enabled = 1
g.vimtex_complete_enabled = 1
g.vimtex_complete_close_braces = 1
g.vimtex_quickfix_mode = 2
g.vimtex_view_enabled = 1
-- g.vimtex_quickfix_ignore_filters = {
--   'empty glossary', 
--   'font warning', 
--   'Overfull', 
--   'specifier change to', 
--   'Underfull'
--   }

g.vimtex_compiler_progname="nvr"
g.vimtex_view_general_viewer = 'okular'
-- g.vimtex_compiler_latexmk = {
--   'backend': 'jobs', 
--   'background': 0, 
--   'build_dir': '_build', 
--   'executable': 'latexmk', 
--   'callback': 1, 
--   'continuous': 1, 
--   'options': {
--     '-pdf', 
--     '-verbose', 
--     '-file-line-error', 
--     '-synctex=1', 
--     '-interaction=nonstopmode'
--    }
--}
