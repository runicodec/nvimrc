-- Netrw
vim.keymap.set("n", "<leader>pf", vim.cmd.Ex)

-- Alternative to save / write
vim.keymap.set("i", "<C-;>", "<cmd>w<cr>")
vim.keymap.set("n", "<C-;>", "<cmd>w<cr>")
vim.keymap.set("v", "<C-;>", "<cmd>w<cr>")

-- Reload neovim config
vim.keymap.set("n", "<leader>sr", function()
  vim.cmd.source({ args = { vim.env.MYVIMRC }, mods = { silent = true } })
end)

-- Terminal
-- NOTE: replaced with glacier.nvim
-- https://github.com/runicodec/glacier.nvim

-- File previews
local preview = require("codec.custom.file_preview")

vim.keymap.set("n", "<leader>pp", function()
  preview.run_preview()
end)

preview.register("python", vim.fn.has("win32") == 1 and "!python %:." or "!python3 %:.")

-- Quick navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Working directory management
vim.keymap.set("n", "<leader>cc", "<cmd>cd %:p:h<cr>") -- set current file directory as working directory
vim.keymap.set("n", "<leader>ch", "<cmd>cd ~<cr>") -- set home directory as working directory

-- Remove highlighting
vim.keymap.set("n", "<leader>nv", "<cmd>noh<cr>")

-- Buffer bindings (<leader>b)
vim.keymap.set("n", "<leader>bn", ":bnext<CR>") -- next buffer
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>") -- previous buffer
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>") -- delete buffer
vim.keymap.set("n", "<leader>bl", ":ls<CR>") -- list buffers
vim.keymap.set("n", "<leader>bf", ":bfirst<CR>") -- first buffer
vim.keymap.set("n", "<leader>be", ":blast<CR>") -- end (last) buffer
--vim.keymap.set("n", "<leader>bs", ":w<CR>")                  -- save (write) buffer

-- Window bindings (<leader>w)
vim.keymap.set("n", "<leader>wv", ":vsplit<CR>") -- vertical split
vim.keymap.set("n", "<leader>ws", ":split<CR>") -- horizontal split
vim.keymap.set("n", "<leader>wh", "<C-w>h") -- move to left window
vim.keymap.set("n", "<leader>wj", "<C-w>j") -- move to window below
vim.keymap.set("n", "<leader>wk", "<C-w>k") -- move to window above
vim.keymap.set("n", "<leader>wl", "<C-w>l") -- move to right window
vim.keymap.set("n", "<leader>w=", "<C-w>=") -- equalize window sizes
vim.keymap.set("n", "<leader>wq", ":q<CR>") -- close window
vim.keymap.set("n", "<leader>wr", "<C-w>r") -- rotate windows

local maximized = false
vim.keymap.set("n", "<leader>wm", function()
  if maximized then
    vim.cmd("wincmd =")
    maximized = false
  else
    vim.cmd("wincmd |")
    vim.cmd("wincmd _")
    maximized = true
  end
end)

-- Resizing windows with easier shortcuts (since HHKB makes arrows harder to reach)
vim.keymap.set("n", "<leader>w,", ":vertical resize -5<CR>") -- decrease width
vim.keymap.set("n", "<leader>w.", ":vertical resize +5<CR>") -- increase width
vim.keymap.set("n", "<leader>w-", ":resize -5<CR>") -- decrease height
vim.keymap.set("n", "<leader>w+", ":resize +5<CR>") -- increase height

-- Tab bindings (<leader>t)
vim.keymap.set("n", "<leader>tt", function()
  vim.cmd("tabnew")
  vim.cmd("Ex")
end)
vim.keymap.set("n", "<leader>tj", ":tabnext<CR>") -- next tab (j for down/next)
vim.keymap.set("n", "<leader>tk", ":tabprevious<CR>") -- previous tab (k for up/prev)
vim.keymap.set("n", "<leader>tq", ":tabclose<CR>") -- close tab
vim.keymap.set("n", "<leader>tl", ":tabs<CR>") -- list tabs
vim.keymap.set("n", "<leader>tf", ":tabfirst<CR>") -- first tab
vim.keymap.set("n", "<leader>te", ":tablast<CR>") -- end (last) tab
vim.keymap.set("n", "<leader>tm", ":tabmove<CR>") -- move tab

-- Quick tab navigation with numbers
for i = 1, 9 do
  vim.keymap.set("n", "<leader>t" .. i, i .. "gt") -- go to tab number i
end
