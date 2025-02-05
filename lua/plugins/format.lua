return {
	"stevearc/conform.nvim",
	keys = {
		{
			"<leader>gf",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			["*"] = { "codespell" },
			lua = { "stylua" },
			python = { "isort", "black" },
			go = { "goimports", "gofmt" },
			c = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			xml = { "prettier" },
		},
	},
}
