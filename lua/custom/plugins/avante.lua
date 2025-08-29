return {
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    version = false,
    opts = {
      debug = true,
      provider = 'claude',
      auto_suggestions_provider = nil,
      rules = {
        project_dir = '.cursor/avanterules/',
      },
      providers = {
        claude = {
          endpoint = 'https://api.anthropic.com',
          model = 'claude-sonnet-4-20250514',
          timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 20480,
          },
        },
        bedrock = {
          model = 'anthropic.claude-sonnet-4-20250514-v1:0',
          aws_profile = 'dev-env',
          aws_region = 'us-east-1',
        },

        -- OpenAI Config
        openai = {
          endpoint = 'https://api.openai.com/v1',
          model = 'gpt-4o-mini', -- your desired model (or use gpt-4o, etc.)
          timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
        },
      },
      input = {
        provider = 'snacks',
        provider_opts = {
          -- Additional snacks.input options
          title = 'Avante Input',
          icon = ' ',
        },
      },
      build = 'make',
      dependencies = {
        'zbirenbaum/copilot.lua', -- Required for copilot provider
        'nvim-treesitter/nvim-treesitter',
        'stevearc/dressing.nvim',
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
        'hrsh7th/nvim-cmp',
        'nvim-tree/nvim-web-devicons',
        -- Optional:
        'echasnovski/mini.pick',
        'nvim-telescope/telescope.nvim',
        'ibhagwan/fzf-lua',
      },
    },
  },
  -- With lazy.nvim
  { 'folke/snacks.nvim' },
}
