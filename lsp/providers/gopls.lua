local M = {}

vim.lsp.config.gopls = {
  cmd = {
    "gopls",
    "serve",
  },
  root_markers = { 
    "go.mod",
  },
  filetypes = {
    "go",
  },
}

return M
