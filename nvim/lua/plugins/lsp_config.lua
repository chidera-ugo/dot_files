return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Setup language servers.
			local map = vim.keymap.set
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local servers = { "lua_ls", "tailwindcss", "html", "clangd" }

			for _, server in ipairs(servers) do
				lspconfig[server].setup({
					capabilities = capabilities,
				})
			end

			lspconfig.eslint.setup({
				capabilities = capabilities,
				settings = {
					eslint = {
						experimental = {
							useFlatConfig = true,
						},
					},
				},
			})

			lspconfig.rust_analyzer.setup({
				-- Server-specific settings. See `:help lspconfig-setup`
				settings = {
					["rust-analyzer"] = {},
				},
				capabilities = capabilities,
			})

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					map("n", "gD", vim.lsp.buf.declaration, opts)
					map("n", "gd", vim.lsp.buf.definition, opts)
					map("n", "K", vim.lsp.buf.hover, opts)
					map("n", "S", vim.lsp.buf.signature_help, opts)
					map("n", "gi", vim.lsp.buf.implementation, opts)
					map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
					map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
					map("n", "<space>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					map("n", "<space>D", vim.lsp.buf.type_definition, opts)
					map("n", "<space>rn", vim.lsp.buf.rename, opts)
					map({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
					map("n", "gr", vim.lsp.buf.references, opts)
					map("n", "<space>f", function()
						vim.lsp.buf.format({ async = true })
					end, opts)
				end,
			})
		end,
	},
}
