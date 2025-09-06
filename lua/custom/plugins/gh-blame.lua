return {
  'dlvhdr/gh-blame.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim' },
  keys = {
    { '<leader>gh', '<cmd>GhBlameCurrentLine<cr>', desc = 'GitHub Blame Current Line' },
  },
  {
    {
      'linrongbin16/gitlinker.nvim',
      cmd = 'GitLink',
      opts = {},
      keys = {
        { '<leader>gy', '<cmd>GitLink<cr>', mode = { 'n', 'v' }, desc = 'Yank git link' },
        { '<leader>gY', '<cmd>GitLink!<cr>', mode = { 'n', 'v' }, desc = 'Open git link' },
      },
    },
  },
}
