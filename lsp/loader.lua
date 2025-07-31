local M = {}

function M.load(providers)
  for _, provider in ipairs(providers) do
    vim.lsp.config[provider.name] = {
      cmd = provider.cmd,
      filetypes = provider.filetypes,
      root_markers = provider.root_markers,
    }

    vim.lsp.enable(provider.name)
  end
end

return M
