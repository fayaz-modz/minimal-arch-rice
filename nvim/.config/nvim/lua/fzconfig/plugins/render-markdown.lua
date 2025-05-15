return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  ft = { "markdown", "md" },
  opts = {},
  config = function ()
    require('render-markdown').setup({
      completions = { lsp = { enabled = true } },
      code = {
        border = "thick",
      }
    })
  end
}
