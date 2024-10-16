vim.filetype.add({
    pattern = { [".*/hypr/.*.conf"] = "hyprlang" },
})

vim.cmd(":set spell spelllang=ru,en_us")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "dart",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})
