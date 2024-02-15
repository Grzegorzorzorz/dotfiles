require("mason").setup()

require("mason-nvim-dap").setup({
	ensure_installed = { 'cppdbg' },
	automatic_setup = true,
	handlers = {}
})

if vim.fn.filereadable('.vscode/launch.json') then
	-- map launch.json type to filetypes (e.g. cppdbg = { 'c', 'cpp' })
	-- require("dap.ext.vscode").json_decode = require("overseer.json").decode
	require('dap.ext.vscode').load_launchjs(nil, { cppdbg = { 'c', 'cpp' } })
end

vim.fn.sign_define('DapBreakpoint', {text='', texthl='ErrorMsg', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='', texthl='ErrorMsg', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='→', texthl='', linehl='CursorLine', numhl=''})

require('telescope').load_extension('dap')
require("dapui").setup({
	controls = {
		enabled = false,
	},
	layouts = { {
		elements = { {
			id = "scopes",
			size = 0.25
		}, {
			id = "breakpoints",
			size = 0.25
		}, {
			id = "stacks",
			size = 0.25
		}, {
			id = "watches",
			size = 0.25
		} },
		position = "right",
		size = 40
	}, {
		elements = { {
			id = "repl",
			size = 0.5
		}, {
			id = "console",
			size = 0.5
		} },
		position = "bottom",
		size = 10
	} },
})

local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.disconnect.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end
