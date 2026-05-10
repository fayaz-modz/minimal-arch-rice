return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,

    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
      },
    },

    config = function()
      local ts = require("nvim-treesitter")

      ts.install({
        "bash",
        "css",
        "go",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "rust",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
      })

      -- enable highlighting
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })

      -- folds
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

      -- indent
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          vim.bo.indentexpr =
            "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

      -- textobjects
      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true,

          keymaps = {
            ["a="] = "@assignment.outer",
            ["i="] = "@assignment.inner",
            ["r="] = "@assignment.rhs",

            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",

            ["ai"] = "@conditional.outer",
            ["ii"] = "@conditional.inner",

            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",

            ["af"] = "@call.outer",
            ["if"] = "@call.inner",

            ["am"] = "@function.outer",
            ["im"] = "@function.inner",

            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },

        move = {
          set_jumps = true,

          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]m"] = "@class.outer",
          },

          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]M"] = "@class.outer",
          },

          goto_prev_start = {
            ["[f"] = "@function.outer",
            ["[m"] = "@class.outer",
          },

          goto_prev_end = {
            ["[F"] = "@function.outer",
            ["[M"] = "@class.outer",
          },

          goto_next = {
            ["gfi"] = "@function.inner",
            ["gmi"] = "@function.inner",
          },

          goto_prev = {
            ["gFi"] = "@function.inner",
            ["gMi"] = "@function.inner",
          },
        },
      })

      -- repeatable motions
      local ts_repeat_move =
        require("nvim-treesitter-textobjects.repeatable_move")

      vim.keymap.set(
        { "n", "x", "o" },
        ";",
        ts_repeat_move.repeat_last_move
      )

      vim.keymap.set(
        { "n", "x", "o" },
        ",",
        ts_repeat_move.repeat_last_move_opposite
      )

      vim.keymap.set(
        { "n", "x", "o" },
        "f",
        ts_repeat_move.builtin_f_expr,
        { expr = true }
      )

      vim.keymap.set(
        { "n", "x", "o" },
        "F",
        ts_repeat_move.builtin_F_expr,
        { expr = true }
      )

      vim.keymap.set(
        { "n", "x", "o" },
        "t",
        ts_repeat_move.builtin_t_expr,
        { expr = true }
      )

      vim.keymap.set(
        { "n", "x", "o" },
        "T",
        ts_repeat_move.builtin_T_expr,
        { expr = true }
      )
    end,
  },
}
