vim.api.nvim_create_autocmd("FileType", {
	pattern = { "md", "tex" },
	callback = function()
		vim.cmd(":set spell spelllang=ru,en_us")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "dart", "lua" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true
	end,
})
