require("keymaps")
require("vimoptions")
require("config.lazy")

local themes = {
  "dayfox",
  "catppuccin-mocha",
  "carbonfox",
}

vim.cmd.colorscheme(themes[2])
