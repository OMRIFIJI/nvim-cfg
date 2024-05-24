vim.filetype.add({
    pattern = { [".*/hypr/.*.conf"] = "hyprlang" },
})

vim.cmd(":set spell spelllang=ru,en_us")
