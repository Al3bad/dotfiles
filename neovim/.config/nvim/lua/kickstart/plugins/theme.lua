-- Doc: https://github.com/olimorris/onedarkpro.nvim?tab=readme-ov-file#configuring-filetype-highlighting
--
---@type string|LazyConfig|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport[][]
return {
  'olimorris/onedarkpro.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    options = { transparency = true },
    filetypes = { all = false },
    colors = { comment = '#60646c' },
  },
  config = function(_, opts)
    require('onedarkpro').setup(opts)
    vim.cmd.colorscheme 'onedark'
    vim.cmd.hi 'Comment gui=none'
  end,
}
