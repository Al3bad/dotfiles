return { -- Highlight, edit, and navigate code
  ---@type string|LazyConfig|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport[][]
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'folke/ts-comments.nvim',
      'windwp/nvim-ts-autotag',
    },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup {
        -- Autoinstall languages that are not installed
        ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc' },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<leader>ts',
            scope_incremental = '<leader>tc',
            node_incremental = '<leader>ti',
            node_decremental = '<leader>td',
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            -- include_surrounding_whitespace = true,
            keymaps = {
              ['af'] = { query = '@function.outer', desc = 'Select [A]round [F]unction' },
              ['if'] = { query = '@function.inner', desc = 'Select [I]nner [F]unction' },
              ['ab'] = { query = '@block.outer', desc = 'Select [A]round [B]lock' },
              ['ib'] = { query = '@block.inner', desc = 'Select [I]nner [B]lock' },
              ['ac'] = { query = '@comment.outer', desc = 'Select [A]round [C]omment' },
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              [']f'] = '@function.outer',
              [']c'] = '@comment.outer',
            },
            goto_next_end = {
              [']F'] = '@function.outer',
              [']C'] = '@comment.outer',
            },
            goto_previous_start = {
              ['[f'] = '@function.outer',
              ['[c'] = '@comment.outer',
            },
            goto_previous_end = {
              ['[F'] = '@function.outer',
              ['[C'] = '@comment.outer',
            },
          },
        },
      }
    end,
  },
  ---@type string|LazyConfig|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport[][]
  { 'nvim-treesitter/nvim-treesitter-textobjects' },
  ---@type string|LazyConfig|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport[][]
  {
    'folke/ts-comments.nvim',
    opts = {},
    event = 'VeryLazy',
    enabled = vim.fn.has 'nvim-0.10.0' == 1,
  },
  ---@type string|LazyConfig|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport[][]
  {
    'windwp/nvim-ts-autotag',
    opts = {
      enable = true,
    },
  },
}
