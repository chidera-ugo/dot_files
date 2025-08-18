return {
	{
	"stevearc/oil.nvim",
		config = function()
require("oil").setup({
  keymaps = {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["<C-v>"] = "actions.select_vsplit",
    ["<C-s>"] = "actions.select_split",
    ["<C-p>"] = "actions.preview",
    ["<C-c>"] = "actions.close",
    ["-"] = "actions.parent",
    ["_"] = "actions.open_cwd",
    ["g."] = "actions.toggle_hidden",
    ["<C-n>"] = "actions.refresh",
  },
  use_default_keymaps = false,
  view_options = { show_hidden = false },
  delete_to_trash = true,
 })
		end,
	}
}
