return {
  file = {
    "BufReadPost",
    "BufNewFile",
    "BufWritePre"
  },

  file_types = {
    'BufEnter *.c',
    'BufEnter *.cpp',
    'BufEnter *.cs',
    'BufEnter *.go',
    'BufEnter *.java',
    'BufEnter *.lua',
    'BufEnter *.py',
    'BufEnter *.rb',
    'BufEnter *.rs',
    'BufEnter *.sql',
    'BufEnter *.ts',
  },

  ft = {
    'c',
    'cpp',
    'cs',
    'go',
    'java',
    'lua',
    'py',
    'ruby',
    'rust',
    'sql',
    'ts',
  },
}
