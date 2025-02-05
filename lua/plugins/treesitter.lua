return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
				"go",
				"gomod",
				"gowork",
				"gosum",
				"python",
			},
			auto_install = true,

			highlight = {
				enable = true,
			},
		})
	end,
}
