return {
  {
    'zbirenbaum/copilot.lua',
    event = 'VeryLazy',
    dependencies = {
      'copilotlsp-nvim/copilot-lsp',
    },
    config = function()
      require('copilot').setup {
        suggestion = {
          enabled = false,
          auto_trigger = true,
          accept = false,
        },
        panel = {
          enabled = false,
        },
        filetypes = {
          markdown = true,
          help = true,
          html = true,
          javascript = true,
          typescript = true,
          ['*'] = true,
        },
        nes = {
          enabled = true,
          keymap = {
            accept_and_goto = '<leader>p',
            accept = false,
            dismiss = '<Esc>',
          },
        },
      }

      vim.keymap.set('i', '<Tab>', function()
        if require('copilot.suggestion').is_visible() then
          require('copilot.suggestion').accept()
        else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, false, true), 'n', false)
        end
      end, {
        silent = true,
      })
    end,
  },
}
