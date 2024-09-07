---@type string|LazyConfig|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport[][]
return {
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  event = 'VeryLazy',
  opts = {
    open_fold_hl_timeout = 400,
    close_fold_kinds_for_ft = {
      -- default = { 'imports', 'comment' },
      -- json = { 'array' },
      -- c = { 'comment', 'region' },
    },
  },
  init = function()
    -- UFO foldinM
    vim.o.foldcolumn = '1' -- '0' is not bad
    vim.o.foldlevel = 999 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 999
    vim.o.foldenable = true
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
  end,
  config = function(_, opts)
    vim.keymap.set('n', 'zn', require('ufo').goNextClosedFold, { desc = 'Go next closed fold' })
    vim.keymap.set('n', 'zp', require('ufo').goPreviousClosedFold, { desc = 'Go previous closed fold' })

    vim.keymap.set('n', 'zR', 'zR', { desc = 'Open All folds' })
    vim.keymap.set('n', 'zM', 'zM', { desc = 'Close All folds' })
    vim.keymap.set('n', 'zr', 'zr', { desc = 'Open one level fold' })
    vim.keymap.set('n', 'zm', 'zm', { desc = 'Close one level fold' })
    require('ufo').setup(opts)
  end,
}
