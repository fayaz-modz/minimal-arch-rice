local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("vim-keymaps")
require("lazy").setup("plugins")

local function load_local_config()
    local local_config_path = vim.fn.getcwd() .. '/.nvim.conf.lua'
    print(local_config_path)
    if vim.fn.filereadable(local_config_path) == 1 then
        dofile(local_config_path)
    end
end

load_local_config()
