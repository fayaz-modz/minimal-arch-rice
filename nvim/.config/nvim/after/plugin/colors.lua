vim.cmd.colorscheme("dracula")

-- Replace these values with the correct colors from the Dracula colorscheme
local dracula_normal_bg = '#282a36'
local dracula_insert_bg = '#50fa7b'
local dracula_visual_bg = '#bd93f9'

-- Define a Lua function to set the cursor color based on the mode
function Set_cursor_color(mode)
  mode = mode or vim.fn.mode()

  if mode == "n" then
    vim.api.nvim_set_hl(0, "Cursor", { fg = dracula_normal_bg, bg = 'white' })
  elseif mode == "i" then
    vim.api.nvim_set_hl(0, "Cursor", { fg = 'white', bg = dracula_insert_bg })
  elseif mode == "v" or mode == "V" or mode == "^V" then
    vim.api.nvim_set_hl(0, "Cursor", { fg = 'white', bg = dracula_visual_bg })
  else
    vim.api.nvim_set_hl(0, "Cursor", { fg = 'white', bg = 'white' })
  end
end

-- Set up an autocmd to call the function on CursorMoved, InsertEnter, and BufWinEnter events
vim.cmd([[autocmd CursorMoved,CursorMovedI,InsertChange,BufWinEnter * lua Set_cursor_color()]])

-- fix for cursor mode still normal while using i key
function Fix_cursor_for_insert()
  vim.cmd([[startinsert]])
  Set_cursor_color("i")
end

vim.keymap.set("n", "i", "<CMD>lua Fix_cursor_for_insert()<CR>")

-- Set up an autocmd to reset the cursor color on InsertLeave event
vim.cmd([[autocmd InsertLeave * hi Cursor guibg=NONE]])
