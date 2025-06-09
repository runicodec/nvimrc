return {
  -- taken / adapted from
  -- https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#lazy-loading-with-lazynvim
  "stevearc/conform.nvim",
  enabled = true,
  event = { "BufWritePre" },
  cmd = { "ConfirmInfo" },
  keys = {
    {
      "<leader>fd",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      c = { "astyle" },
    },
    -- format document on save
    format_on_save = { timeout_ms = 500, lsp_fallback = true },
    formatters = {
      astyle = {
        prepend_args = function()
          local cwDir = vim.fn.getcwd()
          local optionsFilename = cwDir .. "/" .. ".astylerc"

          local optionsFile = io.open(optionsFilename, "r")

          if optionsFile ~= nil then
            io.close(optionsFile)
            return { "--project=" .. optionsFilename }
          end
        end,
      },
    },
  },
}
