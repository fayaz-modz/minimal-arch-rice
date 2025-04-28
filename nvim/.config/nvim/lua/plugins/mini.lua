return {
  'echasnovski/mini.nvim', version = false,
  config = function()
    require("mini.pairs").setup()
    require("mini.ai").setup()
    require('mini.bracketed').setup()
    require('mini.jump2d').setup()
    require('mini.surround').setup()
    require("mini.comment").setup()
  end,
}
