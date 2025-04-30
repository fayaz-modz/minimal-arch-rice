function EvalAndYank()
  vim.ui.input({ prompt = "Eval> " }, function(input)
    if input then
      local env = setmetatable({
        pi = math.pi,
        e = math.exp(1),
      }, { __index = math })

      local chunk, _ = load("return " .. input, "Eval", "t", env)
      if chunk then
        local ok, result = pcall(chunk)
        if ok and result ~= nil then
          vim.fn.setreg('"', tostring(result))
          vim.notify("yanked: " .. tostring(result), vim.log.levels.INFO)
        else
          vim.notify("Eval error", vim.log.levels.ERROR)
        end
      else
        vim.notify("Invalid expression", vim.log.levels.ERROR)
      end
    end
  end)
end

vim.keymap.set('n', "<leader>m", EvalAndYank)
