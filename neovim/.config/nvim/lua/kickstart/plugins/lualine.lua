return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = ' '
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    opts = function()
      local color = require 'onedarkpro.helpers'
      local colors = color.get_preloaded_colors()

      -- PERF: we don't need this lualine require madness 🤷
      local lualine_require = require 'lualine_require'
      lualine_require.require = require

      local icons = {
        diagnostics = {
          Error = ' ',
          Warn = ' ',
          Hint = ' ',
          Info = ' ',
        },
        git = {
          added = ' ',
          modified = ' ',
          removed = ' ',
        },
      }

      vim.o.laststatus = vim.g.lualine_laststatus

      local custom_iceberg = require 'lualine.themes.iceberg_dark'
      custom_iceberg.normal.c.bg = 'none'
      custom_iceberg.inactive.c.bg = 'none'

      for _, mode in pairs(custom_iceberg) do
        mode.a.fg = mode.a.bg
        mode.a.gui = ''

        if mode.c then
          mode.c.fg = mode.b.fg
          mode.c.gui = ''
        end

        for _, section in pairs(mode) do
          section.bg = nil
        end
      end

      local opts = {
        component_separators = { left = ' ', right = ' ' },
        section_separators = { left = ' ', right = ' ' },
        options = {
          theme = custom_iceberg,
          component_separators = '|',
          globalstatus = vim.o.laststatus == 3,
          disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'ministarter' } },
        },
        sections = {
          lualine_a = {
            { 'mode', icon = { '' } },
          },
          lualine_b = {
            { 'branch', icon = { '' }, padding = { right = 2, left = 2 } },
          },
          lualine_c = {
            { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
            {
              'filename',
              symbols = { modified = '', readonly = '' },
              file_status = true,
              newfile_status = true,
              path = 1,
              padding = { left = 0, right = 2 },
              color = { fg = colors.gray },
            },
            {
              require('tmux-status').tmux_windows,
              cond = require('tmux-status').show,
              padding = { left = 2 },
            },
          },
          lualine_x = {
            {
              'diagnostics',
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            {
              function()
                return require('noice').api.status.command.get()
              end,
              cond = function()
                return package.loaded['noice'] and require('noice').api.status.command.has()
              end,
              color = { fg = colors.gray },
            },
            {
              function()
                return require('noice').api.status.mode.get()
              end,
              cond = function()
                return package.loaded['noice'] and require('noice').api.status.mode.has()
              end,
            },
          },
          lualine_y = {
            { 'progress', separator = ' ', padding = { left = 1, right = 0 } },
            { 'location', padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            {
              function()
                return ' ' .. os.date '%R'
              end,
              cond = function()
                return os.getenv 'TMUX' == nil
              end,
            },
            {
              require('tmux-status').tmux_datetime,
              cond = require('tmux-status').show,
              padding = { left = 1, right = 1 },
            },
          },
        },
        extensions = { 'neo-tree', 'lazy' },
      }
      return opts
    end,
  },
  {
    'christopher-francisco/tmux-status.nvim',
    -- lazy = true,
    opts = {},
  },
}
