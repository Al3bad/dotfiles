---@type string|LazyConfig|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport[][]
return { -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
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
            keymaps = {
              ['af'] = { query = '@function.outer', desc = 'Select [A]round [F]unction' },
              ['if'] = { query = '@function.inner', desc = 'Select [I]nner [F]unction' },
              ['ac'] = { query = '@class.outer', desc = 'Select [A]round [C]lass' },
              ['ic'] = { query = '@class.inner', desc = 'Select [I]nner [C]lass' },
              ['ab'] = { query = '@block.outer', desc = 'Select [A]round [B]lock' },
              ['ib'] = { query = '@block.inner', desc = 'Select [I]nner [B]lock' },
              ['as'] = { query = '@scope', query_group = 'locals', desc = 'Select [A]round [S]cope' },
            },
            include_surrounding_whitespace = true,
          },
        },
      }
    end,
  },
  { 'nvim-treesitter/nvim-treesitter-textobjects' },
  {
    'folke/ts-comments.nvim',
    opts = {},
    event = 'VeryLazy',
    enabled = vim.fn.has 'nvim-0.10.0' == 1,
  },
}
