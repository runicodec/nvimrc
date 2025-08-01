---@type LSPProvider
return {
  name = "clangd",
  cmd = { "clangd" },
  filetypes = { "c", "cpp" },
  root_markers = { ".clangd", "CMakeLists.txt" },
}
