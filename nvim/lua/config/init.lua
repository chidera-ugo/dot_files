local configs = {
	"lsp_config",
}

for _, file in ipairs(configs) do
	require("configs." .. file)
end
