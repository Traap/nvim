-- nvim-tree configuration
--
--  See:  

local g = vim.g


g.nvim_tree_side = 'right'
g.nvim_tree_width = 27
g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
g.nvim_tree_gitignore = 1
g.nvim_tree_auto_open = 0
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_width_allow_resize  = 1
g.nvim_tree_special_files = {'README.md', 'Makefile', 'MAKEFILE'}
g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1
}

g.nvim_tree_icons = {
	default = "‣ "
}
