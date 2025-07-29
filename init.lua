-- required before lazy.nvim bootstrapping
vim.g.mapleader = ","

-- general settings
require("codec.options")

-- keybinds
require("codec.keybinds")

-- graphical client configuration
require("codec.graphical")

-- load lsp
require("codec.lsp")

-- load lazy.nvim
require("codec.lazy")

