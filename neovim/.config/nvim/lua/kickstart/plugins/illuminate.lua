---@type string|LazyConfig|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport[][]
return {
  'RRethy/vim-illuminate',
  lazy = false,
  opts = {
    delay = 200,
    large_file_cutoff = 2000,
    large_file_overrides = {
      providers = { 'lsp' },
    },
    providers = {
      'lsp',
      'treesitter',
      'regex',
    },
  },
  config = function(_, opts)
    local illuminate = require 'illuminate'
    illuminate.configure(opts)

    local function map(key, dir, buffer)
      vim.keymap.set('n', key, function()
        illuminate['goto_' .. dir .. '_reference'](true)
      end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. ' Reference', buffer = buffer })
    end

    map(']]', 'next')
    map('[[', 'prev')

    -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        local buffer = vim.api.nvim_get_current_buf()
        map(']]', 'next', buffer)
        map('[[', 'prev', buffer)
      end,
    })
  end,
}
