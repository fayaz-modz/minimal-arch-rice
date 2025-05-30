return {
  'echasnovski/mini.nvim', version = false,
  config = function()
    require("mini.pairs").setup()
    require('mini.bracketed').setup()
    require('mini.jump2d').setup({
      mappings = {
        start_jumping = '<CR>',
      },
    })
    require('mini.surround').setup()
    require("mini.comment").setup()
  end,
}
