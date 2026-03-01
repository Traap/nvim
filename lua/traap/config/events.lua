local filetypes = {
  "c",
  "cpp",
  "cs",
  "go",
  "java",
  "lua",
  "py",
  "ruby",
  "rust",
  "sql",
  "ts",
}

local file_types = {}
for _, ft in ipairs(filetypes) do
  table.insert(file_types, "BufEnter *." .. ft)
end

return {
  file = {
    "BufReadPre",
    "BufNewFile",
  },

  file_types = file_types,

  ft = filetypes,
}
