-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- Related to onedark theme

-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-------------------------------------------------
----> Remove whitespace on save
-------------------------------------------------
local remove_whitespace_on_save_augroup = vim.api.nvim_create_augroup("RemoveWhitespaceOnSave", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "",
  callback = function()
    -- Save current cursor position
    local save_cursor = vim.fn.getpos(".")
    -- remove whitespace
    vim.cmd([[%s/\s\+$//e]])
    -- restore cursor position
    vim.fn.setpos(".", save_cursor)
  end,
  group = remove_whitespace_on_save_augroup,
})

-------------------------------------------------
----> Fore indintation size to be 4 spaces in java files
-------------------------------------------------
autocmd("BufEnter", {
  pattern = "*.java",
  callback = function()
    vim.opt.shiftwidth = 4
  end,
})

-------------------------------------------------
----> Ignore jump history when the mode is changed for snippets
-------------------------------------------------
local luasnip_fix_augroup = augroup("MyLuaSnipHistory", { clear = true })
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*",
  callback = function()
    if
      ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
      and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
      and not require("luasnip").session.jump_active
    then
      require("luasnip").unlink_current()
    end
  end,
  group = luasnip_fix_augroup,
})
