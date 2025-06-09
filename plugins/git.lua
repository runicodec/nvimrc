return {
  "tpope/vim-fugitive",
  enabled = true,

  config = function()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git)                  -- git status 
    vim.keymap.set("n", "<leader>gb", ":Git blame<CR>")      -- git blame
    vim.keymap.set("n", "<leader>gl", ":Git log<CR>")        -- git log
    vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>")     -- git diff
    vim.keymap.set("n", "<leader>ga", ":Git add %<CR>")      -- git add current file
    vim.keymap.set("n", "<leader>gc", ":Git commit<CR>")     -- git commit
    vim.keymap.set("n", "<leader>gp", ":Git push<CR>")       -- git push
  end,
}
