return {
  "Exafunction/windsurf.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("codeium").setup({
      enable_cmp_source = false,
      virtual_text = {
        enabled = true,
        manual = false,
        filetypes = {},
        default_filetype_enabled = true,
        idle_delay = 75,
        virtual_text_priority = 65535,
        map_keys = true,
        accept_fallback = nil,
        key_bindings = {
          accept = "<Tab>",
          accept_word = "<M-e>",
          accept_line = "<M-l>",
          -- Clear the virtual text.
          clear = false,
          next = "<M-]>",
          -- Cycle to the previous completion.
          prev = "<M-[>",
        }
      }
    })
  end
}
