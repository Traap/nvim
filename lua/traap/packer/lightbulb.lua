local  ok, lightbulb = pcall(require, 'nvim-lightbulb')
if not ok then return end

lightbulb.setup({autocmd = {enabled = true}})
