return {
  { 'nvim-telescope/telescope-ui-select.nvim' },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      local keymap = vim.keymap.set
      keymap("n", "<C-p>f", builtin.find_files, { desc = "Files" })
      keymap("n", "<leader><leader>", builtin.oldfiles, { desc = "Recent files" })
      keymap('n', '<C-p>g', builtin.live_grep, { desc = "Grep" })
      keymap('n', '<C-p>b', builtin.buffers, { desc = "Buffers" })
      keymap('n', '<C-p>h', builtin.help_tags, { desc = "Help" })
      keymap('n', '<C-p>f', builtin.git_files, { desc = "Git files" })
      keymap('n', '<C-p>d', builtin.diagnostics, { desc = "Diagnostics" })
      keymap('n', '<C-p>c', builtin.commands, { desc = "Commands" })
      keymap('n', '<C-p>s', builtin.lsp_document_symbols, { desc = "Doc symbols" })
      keymap('n', '<C-p>w', builtin.lsp_workspace_symbols, { desc = "WS symbols" })
      keymap('n', '<C-p>r', builtin.lsp_references, { desc = "References" })
      keymap('n', '<C-p>c', builtin.grep_string, { desc = "Word under cursor" })

      require("telescope").load_extension("ui-select")
    end,
  }
}
