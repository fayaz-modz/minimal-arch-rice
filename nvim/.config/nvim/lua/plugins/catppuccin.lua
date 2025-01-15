return {
  {
    "xiyaowong/transparent.nvim",
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin-mocha"

      IsTransparent = false

      vim.keymap.set('n', '<leader>t', function ()
        if (IsTransparent)
        then
          require("catppuccin").setup({
            transparent_background = false,
          })
          IsTransparent = false
          vim.cmd(":TransparentDisable")
        else
          require("catppuccin").setup({
            transparent_background = true,
          })
          IsTransparent = true
          vim.cmd(":TransparentEnable")
        end
      end)
    end
  }
}
