return {
  'echasnovski/mini.nvim',
  version = false,
  config = function ()
    require('mini.indentscope').setup({
      symbol = "│",
      options = {
        try_as_border = true
      },
    })
  end,
}
