-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local options = {
  cindent = true, -- indent comments starts with #
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  foldcolumn = "0",
  foldlevel = 99,
  foldlevelstart = 99,
  foldenable = true,
  fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]],
  mousemoveevent = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
