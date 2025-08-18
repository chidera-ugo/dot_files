vim.cmd([[let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro']]) -- relative numbers for netrw

local o = vim.opt

o.nu = true
o.relativenumber = true

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true

o.smartindent = true

o.wrap = true

o.swapfile = false
o.backup = false

o.hlsearch = false
o.incsearch = true

o.termguicolors = true

o.scrolloff = 12

o.updatetime = 50

o.foldcolumn = "1"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true
