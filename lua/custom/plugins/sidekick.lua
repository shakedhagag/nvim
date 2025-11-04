return {
  'folke/sidekick.nvim',
  opts = {
    -- add any options here
    nes = { enabled = true },
    cli = {
      mux = {
        enabled = true,
        create = 'terminal',
      },
    },
  },
  config = function(_, opts)
    require('sidekick').setup(opts)
    vim.api.nvim_create_autocmd('User', {
      pattern = 'SidekickNesHide',
      callback = function()
        if disabled then
          disabled = false
          require('tiny-inline-diagnostic').enable()
        end
      end,
    })
    vim.api.nvim_create_autocmd('User', {
      pattern = 'SidekickNesShow',
      callback = function()
        disabled = true
        require('tiny-inline-diagnostic').disable()
      end,
    })
  end,
  keys = {
    {
      '<leader>gi',
      function()
        Snacks.picker.gh_issue()
      end,
      desc = 'GitHub Issues (open)',
    },
    {
      '<leader>gI',
      function()
        Snacks.picker.gh_issue { state = 'all' }
      end,
      desc = 'GitHub Issues (all)',
    },
    {
      '<leader>gp',
      function()
        Snacks.picker.gh_pr()
      end,
      desc = 'GitHub Pull Requests (open)',
    },
    {
      '<leader>gP',
      function()
        Snacks.picker.gh_pr { state = 'all' }
      end,
      desc = 'GitHub Pull Requests (all)',
    },
    {
      '<tab>',
      function()
        -- if there is a next edit, jump to it, otherwise apply it if any
        if require('sidekick').nes_jump_or_apply() then
          return -- jumped or applied
        end
        -- if you are using Neovim's native inline completions
        -- Add a safe check for the API existence
        if vim.lsp.inline_completion and vim.lsp.inline_completion.get and vim.lsp.inline_completion.get() then
          return
        end
        -- any other things (like snippets) you want to do on <tab> go here.
        -- fall back to normal tab
        return '<tab>'
      end,
      mode = { 'i', 'n' },
      expr = true,
      desc = 'Goto/Apply Next Edit Suggestion',
    },
    {
      '<c-.>',
      function()
        require('sidekick.cli').toggle()
      end,
      desc = 'Sidekick Toggle',
      mode = { 'n', 't', 'i', 'x' },
    },
    {
      '<leader>aa',
      function()
        require('sidekick.cli').toggle()
      end,
      desc = 'Sidekick Toggle CLI',
    },
    {
      '<leader>as',
      function()
        require('sidekick.cli').select()
      end,
      -- Or to select only installed tools:
      -- require("sidekick.cli").select({ filter = { installed = true } })
      desc = 'Select CLI',
    },
    {
      '<leader>ad',
      function()
        require('sidekick.cli').close()
      end,
      desc = 'Detach a CLI Session',
    },
    {
      '<leader>at',
      function()
        require('sidekick.cli').send { msg = '{this}' }
      end,
      mode = { 'x', 'n' },
      desc = 'Send This',
    },
    {
      '<leader>af',
      function()
        require('sidekick.cli').send { msg = '{file}' }
      end,
      desc = 'Send File',
    },
    {
      '<leader>av',
      function()
        require('sidekick.cli').send { msg = '{selection}' }
      end,
      mode = { 'x' },
      desc = 'Send Visual Selection',
    },
    {
      '<leader>ap',
      function()
        require('sidekick.cli').prompt()
      end,
      mode = { 'n', 'x' },
      desc = 'Sidekick Select Prompt',
    },
    -- Example of a keybinding to open Claude directly
    {
      '<leader>ac',
      function()
        require('sidekick.cli').toggle { name = 'claude', focus = true }
      end,
      desc = 'Sidekick Toggle Claude',
    },
  },
}
