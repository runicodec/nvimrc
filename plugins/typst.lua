return {
  "kaarmu/typst.vim",
  ft = "typst",
  lazy = false,
  config = function()
    local preview = require("codec.custom.file_preview")

    preview.register("typst", "TypstWatch")
  end,
}
