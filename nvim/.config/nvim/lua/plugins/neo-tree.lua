return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set("n", "<leader>e", ":Neotree float toggle<CR>", {})
    vim.keymap.set("n", "<leader>E", ":Neotree position=left toggle<CR>", {})
    vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})

    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = false,   -- when true, they will just be displayed differently than normal items
          hide_dotfiles = false,
          hide_hidden = false
        }
      }
    })
  end,
}
