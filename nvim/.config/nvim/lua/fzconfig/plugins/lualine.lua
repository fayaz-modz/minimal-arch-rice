return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    "folke/todo-comments.nvim",
  },
  config = function()
    require("lualine").setup({
      options = {
        component_separators = {
          left = "",
          right = "",
        },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              return str:sub(1, 1)
            end,
          },
        },
        lualine_b = {
          "branch",
          {
            "diagnostics",
            symbols = { error = " ", warn = " ", info = " ", hint = "󰛨 " },
          },
        },
        lualine_c = {
          {
            "filename",
            path = 1,
          },
          {
            "diff",
            colored = true, -- Displays a colored diff status if set to true
            symbols = { added = " ", modified = " ", removed = " " },
            source = nil,
          }
        },

        lualine_x = {
          {
            "lsp_status",
            ignore_lsp = {
              "typos_lsp",
              "null-ls",
              "golangci_lint_ls",
            },
          },
          "filetype",
        },
        lualine_y = {
          {
            fmt = function(str)
              return ":" .. str
            end,
          },
        },
        lualine_z = { "location" },
      },
      -- tabline = {
      --   lualine_a = {},
      --   lualine_b = {},
      --   lualine_c = {},
      --   lualine_x = {},
      --   lualine_y = {},
      --   lualine_z = {}
      -- },
    })
  end
}
