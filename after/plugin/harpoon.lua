local  mok, mark = pcall(require, 'harpoon.mark')
if not mok then return end

local  uok, ui = pcall(require, 'harpoon.ui')
if not uok then return end

vim.keymap.set("n", "<leader>ha", mark.add_file)
vim.keymap.set("n", "<leader>hu", ui.toggle_quick_menu)

vim.keymap.set("n", "<A-1>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<A-2>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<A-3>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<A-4>", function() ui.nav_file(4) end)
