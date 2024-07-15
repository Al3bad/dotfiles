---@type string|LazyConfig|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport[][]
return {
  'mistweaverco/kulala.nvim',
  config = function()
    -- Setup is required, even if you don't pass any options
    require('kulala').setup {
      debug = false, -- Enable debug mode
      default_view = 'all',
    }

    vim.filetype.add {
      extension = {
        ['http'] = 'http',
      },
    }

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'http',
      callback = function()
        -- Set up Python-specific keybindings here
        vim.api.nvim_set_keymap('n', '<C-k>', ":lua require('kulala').jump_prev()<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<C-j>', ":lua require('kulala').jump_next()<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<C-l>', ":lua require('kulala').run()<CR>", { noremap = true, silent = true })
      end,
    })
  end,
}
