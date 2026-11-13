require("fzconfig.core")
require("fzconfig.lazy")

-- lsps
vim.lsp.enable("pyrefly")
vim.lsp.enable("svg")
vim.lsp.enable("zedoc")

vim.filetype.add({
      extension = {
        zd = "zedoc",
        zdoc = "zedoc",
      },
    })
