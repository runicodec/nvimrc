return {
  "junegunn/goyo.vim",
  enabled = true,
  config = function()
    vim.keymap.set("n", "<leader>go", "<cmd>Goyo<cr>")
    vim.g.goyo_linenr = 1
  end
}
