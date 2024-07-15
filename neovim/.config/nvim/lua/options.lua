---@class vim.opt
local options = {
  -- Make line numbers default
  number = true,
  relativenumber = true,

  -- Configure how new splits should be opened
  splitright = true,
  splitbelow = true,

  wrap = false,
  expandtab = true, -- convert tabs to spaces
  tabstop = 2, -- insert 4 spaces for a tab
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  shiftround = true,

  -- Enable mouse mode, can be useful for resizing splits for example!
  mouse = 'a',

  -- Don't show the mode, since it's already in status line
  showmode = false,

  -- clipboard = 'unnamedplus',

  -- Enable break indent
  breakindent = true,

  -- Save undo history
  undofile = true,

  -- Keep signcolumn on by default
  signcolumn = 'yes',
  statuscolumn = "%{%v:lua.require('statuscolumn').statuscolumn()%}",

  -- Decrease update time
  updatetime = 250,
  timeoutlen = 300,

  -- Sets how neovim will display certain whitespace in the editor.
  --  See :help 'list'
  --  and :help 'listchars'
  list = true,
  listchars = { tab = '» ', trail = '·', nbsp = '␣' },

  -- enable virtual edit in virtual block mode
  virtualedit = 'block',

  -- Set highlight on search
  hlsearch = true,

  -- Case-insensitive searching UNLESS \C or capital in search
  ignorecase = true,
  smartcase = true,

  -- Preview substitutions live, as you type!
  inccommand = 'split',

  -- Show which line your cursor is on
  cursorline = true,

  -- Minimal number of screen lines to keep above and below the cursor.
  scrolloff = 10,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
