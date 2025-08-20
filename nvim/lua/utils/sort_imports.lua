local fn = vim.fn
local loop = vim.loop

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
	local stdout = loop.new_pipe(false)
	local stderr = loop.new_pipe(false)

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
	if not loop.is_closing(handle) then
		loop.close(handle)
	end
end

function spawn(cmd, opts, input, onexit)
	local input = input or { stdout = function() end, stderr = function() end }
	local handle, pid
	local stdout = loop.new_pipe(false)
	local stderr = loop.new_pipe(false)
	handle, pid = loop.spawn(cmd, vim.tbl_extend("force", opts, { stdio = { stdout, stderr } }), function(code, signal)
		if type(onexit) == "function" then
			onexit(code, signal)
		end
		loop.read_stop(stdout)
		loop.read_stop(stderr)
		safe_close(handle)
		safe_close(stdout)
		safe_close(stderr)
	end)
	loop.read_start(stdout, input.stdout)
	loop.read_start(stderr, input.stderr)
end

return M
