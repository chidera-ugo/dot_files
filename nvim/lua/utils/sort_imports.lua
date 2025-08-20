local fn = vim.fn
local uv = vim.uv or vim.uv

local M = {}

local function find_executable()
	local import_sort_executable = fn.getcwd() .. "/node_modules/.bin/import-sort"
	if 0 == fn.executable(import_sort_executable) then
		local sub_cmd = fn.system("git rev-parse --show-toplevel")
		local project_root_path = sub_cmd:gsub("\n", "")
		import_sort_executable = project_root_path .. "/node_modules/.bin/import-sort"
	end

	if 0 == fn.executable(import_sort_executable) then
		import_sort_executable = "import-sort"
	end
	return import_sort_executable
end

local function onread(err, data)
	if err then
		error("SORT_IMPORT: ", err)
	end
end

function M.sort_import(async)
	local winview = fn.winsaveview()
	local path = fn.fnameescape(fn.expand("%:p"))
	local executable_path = find_executable()
	local stdout = uv.new_pipe(false)
	local stderr = uv.new_pipe(false)

	if fn.executable(executable_path) then
		if true == async then
			spawn(
				executable_path,
				{
					args = { path, "--write" },
				},
				{ stdout = onread, stderr = onread },
				vim.schedule_wrap(function()
					vim.cmd("checktime")
					vim.cmd("edit!")
				end)
			)
		else
			fn.system(executable_path .. " " .. path .. " " .. "--write")
			vim.cmd("checktime")
			vim.cmd("edit!")
			fn.winrestview(winview)
		end
	else
		error("Cannot find import-sort executable")
	end
end

function M.setup()
	vim.api.nvim_command([[command! Sort lua require'utils.sort_imports'.sort_import(true)]])
	vim.keymap.set('n', '<leader>si', function() M.sort_import(true) end, { desc = 'Sort imports' })
end

local function safe_close(handle)
	if not uv.is_closing(handle) then
		uv.close(handle)
	end
end

function spawn(cmd, opts, input, onexit)
	local input = input or { stdout = function() end, stderr = function() end }
	local handle, pid
	local stdout = uv.new_pipe(false)
	local stderr = uv.new_pipe(false)
	handle, pid = uv.spawn(cmd, vim.tbl_extend("force", opts, { stdio = { stdout, stderr } }), function(code, signal)
		if type(onexit) == "function" then
			onexit(code, signal)
		end
		uv.read_stop(stdout)
		uv.read_stop(stderr)
		safe_close(handle)
		safe_close(stdout)
		safe_close(stderr)
	end)
	uv.read_start(stdout, input.stdout)
	uv.read_start(stderr, input.stderr)
end

return M
