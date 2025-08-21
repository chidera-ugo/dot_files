-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set

map("n", "<leader>pv", vim.cmd.Ex)

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("x", "<leader>p", '"_dP')
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')

map("n", "+", "3<C-W>+<CR>")
map("n", "_", "3<C-W>-<CR>")
map("n", ">", "5<C-W><<CR>")
map("n", "<", "5<C-W>><CR>")
map("n", "<leader>H", "0<C-W>|<CR>")
map("n", "<leader>V", "0<C-W>_<CR>")
map("n", "<leader>n", ":enew<CR>")

map("n", "<leader>cc", ":BufDel<CR>")
map("n", "<leader>C", ":bd!<CR>")
map("n", "<leader>ut", ":UndotreeToggle<CR>")

map("n", "<leader>e", ":Neotree toggle filesystem<CR>")

map("n", "<leader>pb", ":BufferLinePick<CR>")
map("n", "<leader>cb", ":BufferLinePickClose<CR>")
map("n", "<leader>[", ":BufferLineCyclePrev<CR>")
map("n", "<leader>]", ":BufferLineCycleNext<CR>")
map("n", "<leader>{", ":BufferLineMovePrev<CR>")
map("n", "<leader>}", ":BufferLineMoveNext<CR>")

map("n", "<leader>fm", vim.lsp.buf.format, {})

map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

map("n", "<C-S>", ":SessionSave<CR>")

map("n", "<leader>gs", ":Git<CR>")
map("n", "<leader>gb", ":Git blame<CR>")
map("n", "<leader>ghc", ":Git log --patch -- %<CR>", {
	desc = "Git history of current file",
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
map("n", "M", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "<space>q", vim.diagnostic.setloclist)

map("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
	desc = "Toggle Spectre",
})
map("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
	desc = "Search current word",
})
map("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
	desc = "Search current word",
})
map("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
	desc = "Search on current file",
})
