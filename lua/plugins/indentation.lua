return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("ibl").setup({
				indent = {
					char = "│",
					tab_char = "│",
				},
				scope = { enabled = false },
				exclude = {
					filetypes = {
						"help",
						"alpha",
						"Trouble",
						"trouble",
						"lazy",
						"mason",
						"notify",
						"man",
					},
				},
			})
		end,
	},
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.indentscope").setup({
				symbol = "│",
				options = {
					try_as_border = true,
				},
			})
		end,
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"man",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
}
