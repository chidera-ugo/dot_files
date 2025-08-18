return {
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
				defaults = {
					file_ignore_patterns = { "**lock", ".git" },
				},
				pickers = {
					find_files = {
						hidden = true,
					},
				},
			})
			require("telescope").load_extension("ui-select")

			local map = vim.keymap.set
			local builtin = require("telescope.builtin")

			map("n", "<leader>ff", builtin.find_files, {})
			map("n", "<leader>lg", builtin.live_grep, {})
			map("n", "<leader>gf", builtin.git_files, {})
			map("n", "<leader>bb", builtin.buffers, {})
			map("n", "<leader>fh", builtin.help_tags, {})
			map("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S] Search [N]eovim files" })
		end,
	},
	"nvim-telescope/telescope-ui-select.nvim",
}
