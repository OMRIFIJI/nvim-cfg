return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},

	config = function()
		vim.keymap.set("n", "<leader>nt", ":Neotree filesystem toggle<CR>", {})
		require("neo-tree").setup({
			window = {
				position = "current",
				mappings = {
					["h"] = "close_node",
					["l"] = "open",
				},
			},
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = true,
				},
			},
		})
	end,
}
