-- required before lazy.nvim bootstrapping
vim.g.mapleader = ","

-- general settings
require("codec.options")

-- keybinds
require("codec.keybinds")

-- load lazy.nvim
require("codec.lazy")
