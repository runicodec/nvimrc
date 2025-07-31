---@type LSPProvider
return {
  name = "gopls",
  cmd = { "gopls", "serve" },
  filetypes = { "go" },
  root_markers = { "go.mod" },
}
