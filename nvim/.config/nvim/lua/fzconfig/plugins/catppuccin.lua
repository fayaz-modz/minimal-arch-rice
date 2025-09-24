return {
  "catppuccin/nvim",
  dependencies = {
    "xiyaowong/transparent.nvim",
  },
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    -- vim.cmd(":TransparentEnable")
    require("catppuccin").setup({
      transparent_background = false,
    })
    vim.cmd.colorscheme "catppuccin-mocha"

    IsTransparent = false

    ToggleTransparent = function()
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
    end
    vim.keymap.set('n', '<leader>T', function() ToggleTransparent() end)
  end
}
