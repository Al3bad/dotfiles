---@type string|LazyConfig|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport[][]
return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    sources = { 'filesystem', 'git_status', 'document_symbols' },
    open_files_do_not_replace_types = { 'terminal', 'Trouble', 'trouble', 'qf', 'Outline' },
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
    },
    default_component_configs = {
      indent = {
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = '',
        expander_expanded = '',
        expander_highlight = 'NeoTreeExpander',
      },
    },
  },
  -- opts = function(_, opts)
  --   opts.open_files_do_not_replace_types = opts.open_files_do_not_replace_types or { 'terminal', 'Trouble', 'qf', 'Outline' }
  --   table.insert(opts.open_files_do_not_replace_types, 'edgy')
  -- end,
  keys = {
    { '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'Toggle file explorer' },
  },
}
