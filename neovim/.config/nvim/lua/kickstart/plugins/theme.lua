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
    colors = {
      -- Make comment darker
      comment = '#60646c',
      -- Custom colours for diffview
      CustomDiffAdd = '#28372f',
      CustomDiffChange = '#253e43',
      CustomDiffDelete = '#412e2f',
    },
    highlights = {
      -- Use custom colours for diffview
      DiffAdd = { bg = '${CustomDiffAdd}' },
      DiffChange = { bg = '${CustomDiffChange}' },
      DiffDelete = { bg = '${CustomDiffDelete}' },
    },
  },
  config = function(_, opts)
    require('onedarkpro').setup(opts)
    vim.cmd.colorscheme 'onedark'
    vim.cmd.hi 'Comment gui=none'
    vim.opt.fillchars:append 'diff: '
  end,
}
