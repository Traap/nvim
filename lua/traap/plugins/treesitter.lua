return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function(plugin, opts)
      if plugin.ensure_installed then
        require("lazyvim.util").deprecate("treesitter.ensure_installed", "treesitter.opts.ensure_installed")
      end
      require("nvim-treesitter.configs").setup(opts)
    end,
    event = 'BufReadPost',
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        'bash',
        'c',
        'c_sharp',
        'cpp',
        'dockerfile',
        'help',
        'html',
        'javascript',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        'python',
        'query',
        'regex',
        'ruby',
        'rust',
        'sql',
        'tsx',
        'typescript',
        'vim',
        'yaml',
      },
    },
  },
}
