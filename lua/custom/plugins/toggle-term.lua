return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    -- Remove the open_mapping to disable automatic keymaps
    direction = 'float',
  },
  config = function(_, opts)
    require('toggleterm').setup(opts)

    -- Function to check if lazygit is running
    local function is_lazygit_running()
      -- Check if current buffer is a terminal running lazygit
      if vim.bo.buftype == 'terminal' then
        local buf_name = vim.api.nvim_buf_get_name(0)
        if buf_name:match 'lazygit' then
          return true
        end
      end

      -- Also check all visible terminal buffers
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buftype == 'terminal' then
          local buf_name = vim.api.nvim_buf_get_name(buf)
          if buf_name:match 'lazygit' then
            return true
          end
        end
      end

      return false
    end

    -- Create your own keymap in normal mode only with lazygit check
    vim.keymap.set('n', '<leader>tt', function()
      if not is_lazygit_running() then
        vim.cmd 'ToggleTerm'
      end
    end, { desc = 'Toggle Terminal' })

    -- Enhanced escape keymap for terminal mode with lazygit check
    vim.keymap.set('t', '<Esc>', function()
      if not is_lazygit_running() then
        vim.cmd 'ToggleTerm'
      else
        -- Send escape to the terminal instead
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', false)
      end
    end, { desc = 'Close Terminal or Send Escape' })
  end,
}
