-- {{{ Alias to vim functions

local g = vim.g
local function keymap(...) vim.api.nvim_set_keymap(...) end

-- ------------------------------------------------------------------------- }}}
-- {{{ Map leader to space

     g.mapleader = [[ ]]
g.maplocalleader = [[ ]]

-- ------------------------------------------------------------------------- }}}
-- {{{ Keybindings

-- Default options applied to each keymap.
local opts = { noremap=true, silent=true }

-- Stop search highlights.
keymap('n', '<leader><space>', '<cmd>noh<CR>', opts)

-- Find files using Telescope command-line suggar.
keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)
keymap('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>', opts)
keymap('n', '<leader>mf', '<cmd>Telescope media_files<cr>', opts)

-- Media files.
require("telescope").load_extension("media_files")
keymap("n", "<Leader>fp", [[<Cmd>lua require('telescope').extensions.media_files.media_files()<CR>]], opts)


-- nvim-tree
keymap('n', '<c-n>',       '<cmd>NvimTreeToggle<cr>', opts)
keymap('n', '<leader>nr',  '<cmd>NvimTreeRefresh<cr>', opts)
keymap('n', '<leader>nf',  '<cmd>NvimTreeFindFile<cr>', opts)

-- Buffer resize
keymap('n', '<a-H>', '<cmd>vertical resize -1<cr>', opts)
keymap('n', '<a-J>', '<cmd>resize +1<cr>', opts)
keymap('n', '<a-K>', '<cmd>resize -1<cr>', opts)
keymap('n', '<a-L>', '<cmd>vertical resize +1<cr>', opts)

-- Copy and Paste
keymap('n', '<leader>cc', 'ggVGg_"+y', opts)
keymap('v', '<leader>cc', '"+y', opts)
keymap('v', '<leader>cv', '"+p', opts)

-- Make only the current buffer visible.
keymap('n', '<leader>oo', '<cmd>only<cr>', opts)

-- Delete the current line.
keymap('n', '-', 'dd', opts)

-- Select (charwise) the contents of the current line, excluding indentation.
keymap('n', 'vv', '^vg_', opts)

-- Select the entire buffer.
keymap('n', 'vaa', 'ggvGg_', opts)
keymap('n', 'Vaa', 'ggvG', opts)

-- Linewise reslection of what you just pasted.
keymap('n', '<leader>V', 'V`', opts)

-- Window movement without Tmux-Navigator
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)

-- Clean trailing whitespaces
keymap('n', '<leader>wr', '<cmd>%s/\r//g<cr>', opts)
keymap('n', '<leader>ws', "mz<cmd>%s//\\s\\+$//<cr><cmd>let @/=''<cr>`z", opts)

-- KJV verse lookup.
keymap('n', 'gk', '<cmd>exec "r!kjv -b -d -w -65" getreg("k", opts)<cr>', opts)

-- Fugitive
keymap('n', '<Leader>gc', '<cmd>G commit<CR>', opts)
keymap('n', '<Leader>gd', '<cmd>G diff<CR>', opts)
keymap('n', '<Leader>gh', '<cmd>silent vert bo help fugitive<cr>', opts)
keymap('n', '<Leader>gl', '<cmd>G log<CR>', opts)
keymap('n', '<Leader>gP', '<cmd>G pull<CR>', opts)
keymap('n', '<Leader>gp', '<cmd>G push<CR>', opts)
keymap('n', '<Leader>gs', '<cmd>Gstatus<CR>', opts)

-- <Tab> to navigate the completion menu
keymap('n', '<S-Tab>', 'pumvisible() ? [[\\<C-p>" : "\\<Tab>"', {expr = true})
keymap('n', '<Tab>',   'pumvisible() ? "\\<C-n>" : "\\<Tab>"',  {expr = true})


 -------------------------------------------------------------------------  }}}
