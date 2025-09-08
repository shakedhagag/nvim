local M = {}

function M.switch_line(src_line_idx, direction)
  if direction == 'up' then
    if src_line_idx == 1 then
      return
    end
    vim.cmd 'move-2'
  elseif direction == 'down' then
    if src_line_idx == vim.fn.line '$' then
      return
    end
    vim.cmd 'move+1'
  end
end

function M.move_selection(direction)
  -- Check if previous mode was visual line mode
  if vim.fn.visualmode() ~= 'V' then
    return
  end

  local start_line = vim.fn.line "'<"
  local end_line = vim.fn.line "'>"
  local num_line = end_line - start_line + 1

  if direction == 'up' then
    if start_line == 1 then
      vim.cmd 'normal! gv'
      return
    end
    vim.cmd(string.format('silent %s,%smove-2', start_line, end_line))
    vim.cmd 'normal! gv'
  elseif direction == 'down' then
    if end_line == vim.fn.line '$' then
      vim.cmd 'normal! gv'
      return
    end
    vim.cmd(string.format('silent %s,%smove+%s', start_line, end_line, num_line))
    vim.cmd 'normal! gv'
  end
end

return M
