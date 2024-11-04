require("conform").setup({
	formatters_by_ft = {
		javascript = { "prettierd", "prettier" },
		html = { "prettierd", "prettier" },
		css = { "prettierd", "prettier" },
		lua = { "stylua" },
		python = { "autopep8" },
		tex = { "latexindent" },
		plaintex = { "latexindent" },
	},
	default_format_opts = {
		stop_after_first = true,
	},
})

require("conform").formatters.prettier = {
	args = function(self, ctx)
		if vim.endswith(ctx.filename, ".ejs") then
			return { "--stdin-filepath", "$FILENAME", "--parser", "html" }
		end
		return { "--stdin-filepath", "$FILENAME" }
	end,
}

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
