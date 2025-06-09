return {
  "m4xshen/autoclose.nvim",
  enabled = true,
  config = function()
    require("autoclose").setup({
      keys = {
        ["'"] = {
          escape = true,
          close = true,
          pair = "''",
          disabled_filetypes = {"","text","markdown","typst"},
        },
        ["<"] = {
          escape = true,
          close = true,
          pair = "<>",
          enabled_filetypes = {"typescriptreact","javascriptreact"},
        },
      }
    })
  end,
  event = "InsertEnter",
}
