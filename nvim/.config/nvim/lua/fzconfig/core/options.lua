vim.cmd("let g:netrw_banner = 0")

vim.opt.guicursor = ""
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.autoread = true

vim.opt.termguicolors = true
vim.g.background = "dark"
vim.opt.colorcolumn = "70"
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.hlsearch = true

vim.opt.isfname:append("@-@")

vim.opt.mouse = "a"
vim.g.editorconfig = true

-- split
vim.opt.splitright = true
vim.opt.splitbelow = true

-- treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"


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
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true
