-- {{{ Alias to vim APis.

local g = vim.g

-- ------------------------------------------------------------------------- }}}
-- {{{ nvim-tree configuration

-- help NvimTree to review defaults.

g.nvim_tree_quit_on_open = 1
g.nvim_tree_disable_window_picker = 1
g.nvim_tree_follow = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_gitignore = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
g.nvim_tree_indent_markers = 1
g.nvim_tree_side = 'right'
g.nvim_tree_special_files = {'README.md', 'Makefile', 'MAKEFILE'}
g.nvim_tree_width = 27

-- ------------------------------------------------------------------------- }}}
