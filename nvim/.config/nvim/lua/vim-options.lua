-- General Settings
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.g.background = "dark"
vim.wo.number = true

-- treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- leader
vim.g.mapleader = " "

-- Highlight Cursor Groups
vim.cmd [[
  highlight CursorNormal guifg=#b1bbfa guibg=#b1bbfa
  highlight CursorInsert guifg=#a3df9f guibg=#a3df9f
  highlight CursorVisual guifg=#eec9ca guibg=#eec9ca
  highlight Cursor gui=reverse guifg=NONE guibg=NONE
]]

-- Cursor Shape Configuration
vim.opt.guicursor = table.concat({
  "n-v-c:block-CursorNormal",
  "i-ci-ve:block-CursorInsert",
  "r-cr:block-CursorInsert",
  "o:block-CursorVisual"
}, ",")

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
