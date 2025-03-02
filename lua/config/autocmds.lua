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

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("VimEnter", {
    group = augroup("autoupdate"),
    callback = function()
        if require("lazy.status").has_updates then
            require("lazy").update({ show = false, })
        end
    end,
})
