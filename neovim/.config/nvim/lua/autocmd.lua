local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- go to last loc when opening a buffer
autocmd('BufReadPost', {
  group = augroup('last_loc', { clear = true }),
  callback = function(event)
    local exclude = { 'gitcommit' }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return ''
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- wrap and check for spell in text filetypes
autocmd('FileType', {
  pattern = { 'text', 'plaintex', 'typst', 'gitcommit', 'markdown' },
  group = augroup('wrap_spell', { clear = true }),
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Set indentation options for different file types
-- autocmd('FileType', {
--   pattern = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
--   group = augroup('WorkTabWidth', { clear = true }),
--   callback = function()
--     local path = vim.api.nvim_buf_get_name(0)
--     if path:match(vim.fn.expand '$HOME' .. '/work') then
--       vim.opt_local.tabstop = 4
--       vim.opt_local.shiftwidth = 4
--       vim.opt_local.softtabstop = 4
--     end
--   end,
-- })

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = { 'git', 'gitsigns_blame', 'git-blame', 'gitcommit', 'gitrebase', 'gitsendemail' },
--   callback = function()
--     vim.opt_local.foldenable = false
--     vim.opt_local.foldcolumn = '0'
--     require('ufo').detach()
--   end,
-- })
