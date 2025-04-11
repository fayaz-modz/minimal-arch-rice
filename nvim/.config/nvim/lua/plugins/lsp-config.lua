return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "typescript-language-server", "lua_ls" }
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      require('mason-lspconfig').setup_handlers({
        function(server)
          lspconfig[server].setup({})
        end,
      })
      local keymap = vim.keymap.set
      keymap('n', 'K', vim.lsp.buf.hover, { desc = "Show hover information" })
      keymap('n', '<leader>gd', vim.lsp.buf.definition, { desc = "Go to definition" })
      keymap('n', '<leader>gr', vim.lsp.buf.references, { desc = "Go to references" })
      keymap('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Trigger code action" })
      keymap('n', '<leader>gD', vim.lsp.buf.declaration, { desc = "Go to declaration" })
      keymap('n', '<leader>gi', vim.lsp.buf.implementation, { desc = "Go to implementation" })
      keymap('n', '<C-k>', vim.lsp.buf.signature_help, { desc = "Show function signature" })
      keymap('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
      keymap('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })
      keymap('n', '<leader>D', vim.lsp.buf.type_definition, { desc = "Go to type definition" })
      keymap('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename symbol" })
      keymap('n', 'gr', vim.lsp.buf.references, { desc = "Go to references (alternative)" })
      keymap('n', '<leader>k', vim.diagnostic.open_float, { desc = "Open floating diagnostic" })
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
