require("conform").setup({
	formatters_by_ft = {
		json = { "prettierd", "prettier" },
		jsonc = { "prettierd", "prettier" },
		javascript = { "prettierd", "prettier" },
		typescript = { "prettierd", "prettier" },
		typescriptreact = { "prettierd", "prettier" },
		html = { "prettierd", "prettier" },
		css = { "prettierd", "prettier" },
		scss = { "prettierd", "prettier" },
		markdown = { "prettierd", "prettier" },
		lua = { "stylua" },
		python = { "autopep8" },
		tex = { "latexindent" },
		plaintex = { "latexindent" },
		rust = { "rustfmt" },
	},
	default_format_opts = {
		stop_after_first = true,
	},
})

require("conform").formatters.prettier = {
	args = function(self, ctx)
		if vim.endswith(ctx.filename, ".php") then
			return { "--stdin-filepath", "$FILENAME", "--parser", "html" }
		end
		if vim.endswith(ctx.filename, ".ejs") then
			return { "--stdin-filepath", "$FILENAME", "--plugin=prettier-plugin-ejs" }
		end
		return { "--stdin-filepath", "$FILENAME" }
	end,
}

require("conform").formatters.rustfmt = {
	command = "/usr/bin/rustfmt",
}

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
