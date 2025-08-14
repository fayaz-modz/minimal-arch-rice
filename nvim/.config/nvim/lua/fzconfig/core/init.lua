require("fzconfig.core.options")
require("fzconfig.core.keymaps")
require("fzconfig.core.lsp")

local function load_local_config()
  local local_config_path = vim.fn.getcwd() .. '/.nvim.conf.lua'
  if vim.fn.filereadable(local_config_path) == 1 then
    vim.notify("loaded custom config")
    vim.notify(local_config_path)
    dofile(local_config_path)
  end
end

load_local_config()

local helpers_path = vim.fn.stdpath("config") .. "/lua/fzconfig/core/helpers"
for _, file in ipairs(vim.fn.readdir(helpers_path)) do
  if file:sub(-4) == ".lua" then
    local mod = "fzconfig.core.helpers." .. file:sub(1, -5)
    require(mod)
  end
end
