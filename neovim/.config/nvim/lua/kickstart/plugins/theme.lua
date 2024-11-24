function custom_tabline()
  local utils = require 'utils'
  local devicons = require 'nvim-web-devicons'
  local openedBufCount = #utils.get_listed_bufs() or 0

  local icon, icon_highlight_group = devicons.get_icon(vim.fn.expand '%:t')
  if icon == nil then
    icon, icon_highlight_group = devicons.get_icon_by_filetype(vim.bo.filetype)
  end

  if icon == nil and icon_highlight_group == nil then
    icon = ''
    icon_highlight_group = 'DevIconDefault'
  end
  if icon then
    icon = icon .. ' '
  end

  vim.o.winbar = ' '
  vim.cmd 'highlight TablineBufCountHighlight guifg=#4289bd gui=bold'
  vim.cmd 'highlight TablinePathHighlight guifg=#60646c gui=bold,underline'

  local colouredTotalBuf = '  %#TablineBufCountHighlight#' .. '(' .. openedBufCount .. ') ' .. '%*'
  local colouredIcon = '%#' .. icon_highlight_group .. '#' .. icon .. '%*'
  local colouredPath = '%#TablinePathHighlight#' .. vim.fn.expand '%' .. '%*' .. ' %#Comment#%m%r%*'

  return colouredTotalBuf .. colouredIcon .. colouredPath
end

return {
  -- Theme
  -- Doc: https://github.com/olimorris/onedarkpro.nvim?tab=readme-ov-file#configuring-filetype-highlighting
  --
  ---@type string|LazyConfig|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport[][]
  {
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
  },
  -- Tabline
  {
    'nvim-tree/nvim-web-devicons',
    enabled = vim.g.have_nerd_font,
    config = function()
      vim.o.tabline = '%!v:lua.custom_tabline()'
      vim.o.showtabline = 2 -- Always show the tabline
    end,
  },
}
