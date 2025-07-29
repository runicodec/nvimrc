-- neovide-specific settings
if vim.g.neovide ~= nil then
  vim.o.guifont = "UbuntuMono Nerd Font:h20"

  -- Toggle fullscreen with F11 in Neovide
  vim.api.nvim_set_keymap('n', '<F11>', [[<Cmd>lua vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen<CR>]], { noremap = true, silent = true })

  -- dynamic resizing
  vim.keymap.set({ "n", "v" }, "<C-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
  vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
  vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end

-- goneovim-specific settings
if vim.g.goneovim ~= nil then
  vim.o.guifont = "UbuntuMono Nerd Font:h20"
end
