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

      isTransparent = false

      vim.keymap.set('n', '<leader>t', function ()
        if (isTransparent)
        then
          require("catppuccin").setup({
            transparent_background = false,
          })
          isTransparent = false
          vim.cmd(":TransparentDisable")
        else
          require("catppuccin").setup({
            transparent_background = true,
          })
          isTransparent = true
          vim.cmd(":TransparentEnable")
        end
      end)
    end
  }
}
