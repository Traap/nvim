local  ok, npairs = pcall(require, 'nvim-autopairs')
if not ok then return end

npairs.setup()

local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
local cmp_ok, cmp pcall(require, 'cmp')
if cmp_ok then
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
end
