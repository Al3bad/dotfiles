-- [[ Configure and install plugins ]]
require('lazy').setup {
  'tpope/vim-sleuth',
  'Issafalcon/lsp-overloads.nvim',
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    opts = { enable_autocmd = false },
  },

  require 'kickstart.plugins.theme',
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.mini',
  require 'kickstart.plugins.illuminate',
  require 'kickstart.plugins.autotag',
  require 'kickstart.plugins.todo-comments',
  require 'kickstart.plugins.neotree',
  require 'kickstart.plugins.which-key',
  require 'kickstart.plugins.gitsigns',
  require 'kickstart.plugins.lspconfig',
  require 'kickstart.plugins.treesitter',
  require 'kickstart.plugins.cmp',
  require 'kickstart.plugins.conform',
  require 'kickstart.plugins.telescope',
  require 'kickstart.plugins.debug',

  require 'kickstart.plugins.rest',
  require 'kickstart.plugins.discord-presence',
  require 'kickstart.plugins.wakatime',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information see: :help lazy.nvim-lazy.nvim-structuring-your-plugins
  -- { import = 'custom.plugins' },
}
