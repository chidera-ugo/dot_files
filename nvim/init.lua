require("keymaps")
require("vimoptions")
require("config.lazy")

-- Setup sort imports functionality
local sort_imports = require("utils.sort_imports")
sort_imports.setup()

local themes = {
  "dayfox",
  "catppuccin-mocha",
  "carbonfox",
}

vim.cmd.colorscheme(themes[2])
