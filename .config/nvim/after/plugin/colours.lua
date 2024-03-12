function ColourMyPencils(colour)
	if os.getenv("TERM") == "linux" then
		return
	end
	colour = colour or "onenord"
	vim.opt.termguicolors = true
	vim.cmd.colorscheme(colour)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
end

ColourMyPencils()

require("ibl").setup({
	indent = {
		char = "▏",
		repeat_linebreak = false,
	},
	scope = {
		enabled = true,
		show_start = false,
		show_end = false,
	},
	whitespace = {
		remove_blankline_trail = true,
	},
})
