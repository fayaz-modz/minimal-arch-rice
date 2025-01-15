return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local keymap = vim.keymap.set
    keymap('n', '<leader>e', ':Neotree float toggle<CR>', { desc = "Toggle Neotree in floating mode" })
    keymap('n', '<leader>E', ':Neotree position=left toggle<CR>', { desc = "Toggle Neotree on the left" })
    keymap('n', '<leader>bf', ':Neotree buffers reveal float<CR>', { desc = "Reveal buffers in Neotree (floating)" })

    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = false, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = false,
          hide_hidden = false
        }
      }
    })
  end,
}
