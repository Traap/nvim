return {
  "junegunn/vim-easy-align",
  event = require("traap.config.events").file,
  enabled = true,

  config = function()

    vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)', { desc = 'EasyAlign'})
    vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)', { desc = 'EasyAlign'})

    vim.keymap.set(
      'n', '<bar>',
      function()
        vim.cmd([[NoiceDisable]])
        vim.opt.cmdheight = 1
        vim.cmd("normal gaip*|")
        vim.opt.cmdheight = 0
        vim.cmd([[NoiceEnable]])
      end,
      { desc = 'EasyAlign gaip*<bar>'}
    )

    vim.keymap.set(
      'n', '<leader>0',
      function()
        vim.cmd([[NoiceDisable]])
        vim.opt.cmdheight = 1
        vim.cmd("normal gaip*,")
        vim.opt.cmdheight = 0
        vim.cmd([[NoiceEnable]])
      end,
      { desc = 'EasyAlign gaip=,'}
    )

    vim.keymap.set(
      'n', '<leader>1',
      function()
        vim.cmd([[NoiceDisable]])
        vim.opt.cmdheight = 1
        vim.cmd("normal gaip=,")
        vim.opt.cmdheight = 0
        vim.cmd([[NoiceEnable]])
      end,
      { desc = 'EasyAlign gaip=,'}
    )

    vim.keymap.set(
      'n', '<leader>2',
      function()
        vim.cmd([[NoiceDisable]])
        vim.opt.cmdheight = 1
        vim.cmd("normal gaip= ")
        vim.opt.cmdheight = 0
        vim.cmd([[NoiceDisable]])
      end,
      { desc = 'EasyAlign gaip=<space>'}
    )

  end,
}
