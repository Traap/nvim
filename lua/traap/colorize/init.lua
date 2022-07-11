-- {{{ Setup colorizer.

local  colorizer_ok, colorizer = pcall(require, 'colorizer')
if not colorizer_ok then return end

colorizer.setup(
  {"*"},
  {
    RGB      = true,         -- #RGB hex codes
    RRGGBB   = true,         -- #RRGGBB hex codes
    RRGGBBAA = true,         -- #RRGGBBAA hex codes
    css      = false,        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn   = false,        -- Enable all CSS *functions*: rgb_fn, hsl_fn
    hsl_fn   = true,         -- CSS hsl() and hsla() functions
    names    = false,        -- "Name" codes like Blue oe blue
    rgb_fn   = true,         -- CSS rgb() and rgba() functions
    mode     = "background", -- Modes: foreground, background, virtualtext
  }
)

-- ------------------------------------------------------------------------- }}}
