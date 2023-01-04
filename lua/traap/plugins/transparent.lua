-- {{{ Bail when requried packages are not loaded.q

local  ok, transparent = pcall(require, 'transparent')
if not ok then return end

-- --------------------------------------------------------------------------}}}
-- {{{ Use defaults or customzie this plugin.

local customize = require('traap.core.customize').transparent
if not customize then
  transparent.setup({enable = false,})
  return
end

-- --------------------------------------------------------------------------}}}
-- {{{ Transparenbt custom setup.

transparent.setup({
  enable = true,
  extra_gropus = {
    'Comment',
    'Folded',
    'Normal',
  },
  exclude = {
    'EndOfBuffer',
    'NonText',
  }
})

-- --------------------------------------------------------------------------}}}
