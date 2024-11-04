-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"jacoborus/tender.vim",
		as = "tender.nvim",
		config = function()
			vim.cmd("colorscheme tender")
		end,
	})

	use("rmehri01/onenord.nvim")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ -- Optional
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	})

	use({
		"jiaoshijie/undotree",
		config = function()
			require("undotree").setup()
		end,
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	use({ "norcalli/nvim-colorizer.lua" })

	use({ "mfussenegger/nvim-dap" })
	use({ "jay-babu/mason-nvim-dap.nvim" })
	use({ "theHamsta/nvim-dap-virtual-text" })
	use({ "nvim-telescope/telescope-dap.nvim", requires = { "mfussenegger/nvim-dap" } })

	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } })
	use("lukas-reineke/indent-blankline.nvim")

	use({ "stevearc/overseer.nvim" })

	use({
		"rshkarin/mason-nvim-lint",
		requires = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-lint",
		},
	})
	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})
	use({
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	})
	use({
		"OXY2DEV/markview.nvim",
		requires = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		use({
			"epwalsh/obsidian.nvim",
			tag = "*",
			requires = {
				"nvim-lua/plenary.nvim",
			},
		}),
	})
end)
