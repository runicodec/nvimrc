return {
  "nvim-telescope/telescope.nvim",
  enabled = true,
  tag = "0.1.6",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    teleBuiltins = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", teleBuiltins.find_files, {})
    vim.keymap.set("n", "<leader>fg", teleBuiltins.live_grep, {})
    vim.keymap.set("n", "<leader>fm", teleBuiltins.man_pages, {})
    vim.keymap.set(
      "n",
      "<leader>pd",
      "<cmd>lua require('codec.custom.project_selector').ldr_cd()<CR>",
      { noremap = true, silent = true }
    )
  end,
}
