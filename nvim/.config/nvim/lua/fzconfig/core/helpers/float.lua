local NoteBuffer = nil
local BufWin = nil

local ok, Snacks = pcall(require, "snacks")
if not ok then
  Snacks = nil
end

local function openNote(path)
  local expanded_path
  if path == nil then
    if NoteBuffer == nil then
      expanded_path = vim.fn.expand(ProjectNotes)
    else
      expanded_path = vim.api.nvim_buf_get_name(NoteBuffer)
    end
  else
    expanded_path = vim.fn.expand(path or ProjectNotes)
  end
  vim.fn.mkdir(vim.fn.fnamemodify(expanded_path, ":h"), "p")

  if NoteBuffer == nil then
    NoteBuffer = vim.fn.bufnr(expanded_path, true)
    if NoteBuffer == -1 then
      vim.notify("could not create buffer")
      return
    end
  elseif NoteBuffer == -1 then
    vim.notify("could not create buffer")
    return
  elseif NoteBuffer >= 0 then
    if vim.bo[NoteBuffer].modified then
      vim.notify("buffer is modified")
    else
      vim.notify(vim.api.nvim_buf_get_name(NoteBuffer))
      if vim.api.nvim_buf_get_name(NoteBuffer) ~= expanded_path then
        vim.api.nvim_buf_delete(NoteBuffer, { force = false })
        NoteBuffer = vim.fn.bufnr(expanded_path, true)
      end
    end
    if BufWin ~= nil then
      vim.api.nvim_win_set_buf(BufWin, NoteBuffer)
      return
    end
  end

  -- if Snacks then
  --   local w = Snacks.win({
  --     border = "rounded",
  --     buf = NoteBuffer,
  --     minimal = false,
  --     width = 0.7,
  --     height = .7
  --   })
  --   vim.notify(w)
  -- else
  local ui = vim.api.nvim_list_uis()[1]
  local width = math.floor(ui.width * 0.7)
  local height = math.floor(ui.height * 0.7)

  local opts = {
    -- style = "minimal",
    relative = "editor",
    width = width,
    height = height,
    row = (ui.height - height) / 2,
    col = (ui.width - width) / 2,
    border = "rounded",
  }

  WinBuf = vim.api.nvim_open_win(NoteBuffer, true, opts)
  vim.api.nvim_set_current_win(WinBuf)
  vim.bo[NoteBuffer].filetype = 'markdown'
  -- end
  vim.api.nvim_buf_set_keymap(NoteBuffer, 'n', 'q', '<cmd>hide<CR>', {
    noremap = true,
    silent = true,
  })
  vim.api.nvim_buf_set_keymap(NoteBuffer, 'n', '<ESC>', '<cmd>hide<CR>', {
    silent = true,
  })
end

local function openFolder(path)
  if BufWin then
    vim.notify("closing")
    vim.api.nvim_win_close(BufWin, false)
    BufWin = nil
  end
  local expanded_path = vim.fn.expand(path or "~/mybrain")
  local stat = vim.uv.fs_stat(expanded_path)
  local folder
  if stat then
    if stat.type == "file" then
      folder = vim.fn.fnamemodify(expanded_path, ":h")
    elseif stat.type == "directory" then
      folder = expanded_path
    end
  else
    vim.fn.mkdir(expanded_path, "p")
    folder = expanded_path
  end

  if Snacks then
    Snacks.explorer({
      cwd = folder,
      auto_close = true,
      cmd = "rg",
      actions = {
        enter = function(picker, item)
          if vim.fn.isdirectory(item.file) == 1 then
            picker:action("confirm")
            return
          end
          picker:close()
          openNote(item.file)
        end
      },
      on_show = function(picker)
        if NoteBuffer ~= nil then
          local bufname = vim.api.nvim_buf_get_name(NoteBuffer)
          vim.notify("found buffer" .. bufname)
          if bufname then
            local items = picker:items()
            for _, item in ipairs(items) do
              if item.file == bufname then
                picker.list:view(item.idx)
                Snacks.picker.actions.list_scroll_center(picker)
                return
              end
            end
          end
        end
      end,
      win = {
        list = {
          keys = {
            ["<CR>"] = "enter",
          }
        }
      },
      layout = {
        layout = {
          backdrop = false,
          row = 1,
          width = 0.4,
          min_width = 80,
          height = 0.8,
          border = "none",
          box = "vertical",
          { win = "preview", title = "{preview}", height = 0.4, border = "rounded" },
          {
            box = "vertical",
            border = "rounded",
            title = "{title} {live} {flags}",
            title_pos = "center",
            { win = "input", height = 1,     border = "bottom" },
            { win = "list",  border = "none" },
          },
        },
      },
      confirm = function(picker, item)
        picker:close()
        if item and item.file then
          -- Store the file path in our local variable
          local selected_file_path = item.file
          vim.notify("Selected file path stored: " .. selected_file_path, vim.log.levels.INFO) -- Optional notification
        end
        -- Close the picker window after processing the selection
      end,
    })
  else
    openNote(folder)
  end
end

vim.keymap.set('n', "<leader>md", function() openNote() end, { desc = "open draft note" })
vim.keymap.set('n', "<leader>me", function()
  local mybrain = vim.fn.expand(os.getenv("NOTES_HOME") or "~/notes")
  openFolder(mybrain)
end, { desc = "open my brain" })
vim.keymap.set('n', "<leader>md", function()
  local disposable_notes = vim.fn.expand(os.getenv("DISPOSABLE_NOTES") or "~/notes/nvim-disposable.md")
  openNote(disposable_notes)
end, { desc = "open my brain" })
