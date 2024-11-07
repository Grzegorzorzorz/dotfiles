local lsp = require("lsp-zero").preset({
	manage_nvim_cmp = {
		set_sources = "recommended",
	},
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<Enter>"] = cmp.mapping.confirm({ select = false }),
})

local kind_icons = {
	Text = "",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰇽",
	Variable = "󰂡",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰅲",
}

local kind_icons = {
	Text = "  ",
	Method = "  ",
	Function = "  ",
	Constructor = "  ",
	Field = "  ",
	Variable = "  ",
	Class = "  ",
	Interface = "  ",
	Module = "  ",
	Property = "  ",
	Unit = "  ",
	Value = "  ",
	Enum = "  ",
	Keyword = "  ",
	Snippet = "  ",
	Color = "  ",
	File = "  ",
	Reference = "  ",
	Folder = "  ",
	EnumMember = "  ",
	Constant = "  ",
	Struct = "  ",
	Event = "  ",
	Operator = "  ",
	TypeParameter = "  ",
}

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s %s ", kind_icons[vim_item.kind], vim_item.kind)
			vim_item.menu = ({})[entry.source.name]
			return vim_item
		end,
	},
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
end)

require("lspconfig").clangd.setup({
	cmd = {
		"clangd",
		"--header-insertion=never",
	},
})

require("lspconfig").pylsp.setup({
	settings = {
		pylsp = {
			plugins = {
				autopep8 = {
					enabled = false,
				},
				pycodestyle = {
					enabled = false,
				},
			},
		},
	},
})

require("lspconfig").arduino_language_server.setup({
	cmd = {
		"arduino-language-server",
		--"-clangd", "/usr/lib/llvm/16/bin/clangd",
		"-cli",
		"/home/grzegorz/.local/bin/arduino-cli",
		"-cli-config",
		"/home/grzegorz/.arduino15/arduino-cli.yaml",
		"-fqbn",
		"arduino:avr:uno",
	},
})

require("lspconfig").ltex.setup({
	filetypes = { "latex", "tex", "bib", "markdown", "gitcommit", "text" },
	ltex = {
		language = "en-GB",
	},
})

lsp.setup()
