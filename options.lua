vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.wrap = false 

vim.opt.autoindent = true   -- on by default in nvim, good to explicitly enable anyways
vim.opt.smartindent = true

vim.opt.termguicolors = true 

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

-- if on Windows and bash is installed, set the default shell from cmd.exe to bash
if vim.fn.has('win32') == 1 and vim.fn.executable('bash') == 1 then
  vim.opt.shell = 'bash'
  vim.opt.shellcmdflag = '--login -i'
  vim.opt.shellxquote = ''
end

-- enable relative line numbers in Netrw
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'netrw',
  callback = function()
    vim.opt_local.relativenumber = true
    vim.opt_local.number = true
  end
})

-- always only show the help window
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.txt",
  callback = function()
    if vim.bo.buftype == "help" then
      vim.cmd("only")
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "man",
  callback = function()
    vim.cmd("only")
  end,
})

-- use system clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")
