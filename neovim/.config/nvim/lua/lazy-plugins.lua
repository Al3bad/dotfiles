---@type string|LazyConfig|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport[][]
require('lazy').setup {
  'tpope/vim-repeat',
  require 'kickstart.plugins.lazydev',
  require 'kickstart.plugins.theme',
  require 'kickstart.plugins.indent-line',
  require 'kickstart.plugins.indent-guess',
  require 'kickstart.plugins.fold',
  require 'kickstart.plugins.noice',
  require 'kickstart.plugins.lualine',
  require 'kickstart.plugins.mini',
  require 'kickstart.plugins.todo-comments',
  require 'kickstart.plugins.treesitter',
  'Issafalcon/lsp-overloads.nvim',
  require 'kickstart.plugins.lspconfig',
  require 'kickstart.plugins.illuminate',
  require 'kickstart.plugins.conform',
  require 'kickstart.plugins.cmp',
  require 'kickstart.plugins.telescope',
  require 'kickstart.plugins.harpoon',
  require 'kickstart.plugins.file-explorer',
  require 'kickstart.plugins.search-and-replace',
  require 'kickstart.plugins.gitsigns',
  require 'kickstart.plugins.discord-presence',
  require 'kickstart.plugins.wakatime',
  require 'kickstart.plugins.rest',
  { import = 'custom.plugins' },
}
