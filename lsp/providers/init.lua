---@type LSPProvider[]
return {
  require("codec.lsp.providers.gopls"),
  require("codec.lsp.providers.lua_ls"),
  require("codec.lsp.providers.clangd"),
}
