return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  ft = { "markdown", "md" },
  opts = {},
  config = function()
    require('render-markdown').setup({
      completions = { lsp = { enabled = true } },
      code = {
        border = "thick",
      },
      checkbox = {
        custom = {
          todo = { raw = "[/]", rendered = " " },
          resched = { raw = '[>]', rendered = " " },
          sched = { raw = '[<]', rendered = " " },
          imp = { raw = '[!]', rendered = " " },
          que = { raw = '[?]', rendered = " " },
          inf = { raw = '[i]', rendered = " " },
          amo = { raw = '[S]', rendered = " " },
          star = { raw = '[*]', rendered = " " },
          book = { raw = '[b]', rendered = " " },
          quote = { raw = '["]', rendered = " " },
          note = { raw = '[n]', rendered = " " },
          loca = { raw = '[l]', rendered = " " },
          idea = { raw = '[I]', rendered = "󰛨 " },
          pro = { raw = '[p]', rendered = " " },
          con = { raw = '[c]', rendered = " " },
          up = { raw = '[u]', rendered = "󰔵 " },
          down = { raw = '[d]', rendered = "󰔳 " },
        }
      }
    })
  end
}
