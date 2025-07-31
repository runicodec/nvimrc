---@type LSPProvider
return {
  name = "lua_language_server",
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { "init.lua" },
}
