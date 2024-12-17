return {
  "kevinhwang91/nvim-bqf",
  enabled = true,
  event = require("traap.config.events").file,
  opts = {
    auto_enable = true,
    magic_window = true,
    auto_resize_height = true, -- highly recommended enable
    preview = {
      auto_preview = true,
      -- border = {'ΓöÅ', 'Γöü', 'Γöô', 'Γöâ', 'Γö¢', 'Γöü', 'Γöù', 'Γöâ'},
      border = "rounded",
      buf_label = true,
      delay_syntax = 80,
      show_scroll_bar = false,
      show_title = false,
      should_preview_cb = function(bufnr, _)
        local ret = true
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        local fsize = vim.fn.getfsize(bufname)
        if fsize > 100 * 1024 then
          ret = false
        elseif bufname:match('^fugitive://') then
          ret = false
        end
        return ret
      end,
      win_height = 12,
      win_vheight = 12,
      winblend = 12,
      wrap = false,
    },
    -- make `drop` and `tab drop` to become preferred
    func_map = {
      drop = 'o',
      openc = 'O',
      split = '<C-s>',
      tabdrop = '<C-t>',
      -- set to empty string to disable
      tabc = '',
      ptogglemode = 'z,',
    },
    filter = {
      fzf = {
        action_for = {['ctrl-s'] = 'split', ['ctrl-t'] = 'tab drop'},
        extra_opts = {'--bind', 'ctrl-o:toggle-all', '--prompt', '> '}
      }
    }
  },
}
