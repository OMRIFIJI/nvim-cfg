local map = vim.keymap.set

map('n', '<leader>t2', function ()
    vim.o.tabstop = 2
    vim.o.softtabstop = 2
    vim.o.shiftwidth = 2
end, {})

map('n', '<leader>t4', function ()
    vim.o.tabstop = 4
    vim.o.softtabstop = 4
    vim.o.shiftwidth = 4
end, {})


map('n', '<leader>ut', vim.cmd.UndotreeToggle)
map('n', '<leader>bfa', [[:s/(/(\r/ | s/, */,\r/g | s/)/\r)/<CR>]])
