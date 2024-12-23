-- https://github.com/NMAC427/guess-indent.nvim

---@type string|LazyConfig|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport[][]
return {
  'NMAC427/guess-indent.nvim',
  opts = {
    filetype_exclude = { -- A list of filetypes for which the auto command gets disabled
      'netrw',
      'tutor',
    },
    buftype_exclude = { -- A list of buffer types for which the auto command gets disabled
      'help',
      'nofile',
      'terminal',
      'prompt',
    },
  },
}
